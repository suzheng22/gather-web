<?php
class Curl {

	private $_ci;
	private $response = '';
	private $session;
	private $url;
	private $options = array();
	private $headers = array();
	public $error_code;
	public $error_string;
	public $info;

	function __construct($url = '')
	{
		$this->_ci = & get_instance();
		log_message('debug', 'cURL Class Initialized');

		if ( ! $this->is_enabled())
		{
			log_message('error', 'cURL Class - PHP was not built with cURL enabled. Rebuild PHP with --with-curl to use cURL.');
		}

		$url AND $this->create($url);
	}

	function __call($method, $arguments)
	{
		if (in_array($method, array('simple_get', 'simple_post', 'simple_put', 'simple_delete')))
		{
			// Take off the "simple_" and past get/post/put/delete to _simple_call
			$verb = str_replace('simple_', '', $method);
			array_unshift($arguments, $verb);
			return call_user_func_array(array($this, '_simple_call'), $arguments);
		}
	}

	/**
	 * 快捷的cURL请求
	 *
	 * @param string $method
	 * @param string $url
	 * @param array $params
	 * @param array $options
	 */
	public function _simple_call($method, $url, $params = array(), $options = array())
	{
		if ($method === 'get')
		{
			//如果是一个已经存在的URL，则新建一个会话
			$this->create($url.($params ? '?'.http_build_query($params) : ''));
		}

		else
		{
			$this->create($url);

			$this->{$method}($params);
		}
		//添加自定义属性
		$this->options($options);

		return $this->execute();
	}

	/**
	 * 快速的FTP
	 *
	 * @param string $url
	 * @param string $file_path
	 * @param string $username
	 * @param string $password
	 */
	public function simple_ftp_get($url, $file_path, $username = '', $password = '')
	{
		//如果URL没有以ftp或者sftp开头则自动添加该开头
		if ( ! preg_match('!^(ftp|sftp)://! i', $url))
		{
			$url = 'ftp://' . $url;
		}

		//登陆
		if ($username != '')
		{
			$auth_string = $username;

			if ($password != '')
			{
				$auth_string .= ':' . $password;
			}

			//拼接带有用户认证信息的URL串
			$url = str_replace('://', '://' . $auth_string . '@', $url);
		}

		//拼接文件路径
		$url .= $file_path;

		$this->option(CURLOPT_BINARYTRANSFER, TRUE);
		$this->option(CURLOPT_VERBOSE, TRUE);

		return $this->execute();
	}

	/**
	 * POST
	 *
	 * @param mixed $params	参数
	 * @param mixed $options 属性
	 */
	public function post($params = array(), $options = array())
	{
		//拼接请求字符串
		if (is_array($params))
		{
			$params = http_build_query($params, NULL, '&');
		}

		//添加自定义属性
		$this->options($options);

		$this->http_method('post');

		$this->option(CURLOPT_POST, TRUE);
		$this->option(CURLOPT_POSTFIELDS, $params);
	}

	/**
	 * PUT
	 *
	 * @param unknown_type $params
	 * @param unknown_type $options
	 */
	public function put($params = array(), $options = array())
	{
		if (is_array($params))
		{
			$params = http_build_query($params, NULL, '&');
		}

		$this->options($options);

		$this->http_method('put');
		$this->option(CURLOPT_POSTFIELDS, $params);

		$this->option(CURLOPT_HTTPHEADER, array('X-HTTP-Method-Override: PUT'));
	}

	/**
	 * DELETE
	 *
	 * @param mixed $params
	 * @param mixed $options
	 */
	public function delete($params, $options = array())
	{
		if (is_array($params))
		{
			$params = http_build_query($params, NULL, '&');
		}

		$this->options($options);

		$this->http_method('delete');

		$this->option(CURLOPT_POSTFIELDS, $params);
	}

	/**
	 * 设置Cookies
	 *
	 * @param mixed $params
	 */
	public function set_cookies($params = array())
	{
		if (is_array($params))
		{
			$params = http_build_query($params, NULL, '&');
		}

		$this->option(CURLOPT_COOKIE, $params);
		return $this;
	}

	/**
	 * header
	 *
	 * @param mixed $header
	 * @param string $content
	 */
	public function http_header($header, $content = NULL)
	{
		$this->headers[] = $content ? $header . ': ' . $content : $header;
	}

	/**
	 * 设置method
	 *
	 * @param string $method
	 */
	public function http_method($method)
	{
		$this->options[CURLOPT_CUSTOMREQUEST] = strtoupper($method);
		return $this;
	}

	/**
	 * LOGIN
	 *
	 * @param string $username
	 * @param string $password
	 * @param string $type
	 */
	public function http_login($username = '', $password = '', $type = 'any')
	{
		$this->option(CURLOPT_HTTPAUTH, constant('CURLAUTH_' . strtoupper($type)));
		$this->option(CURLOPT_USERPWD, $username . ':' . $password);
		return $this;
	}

	/**
	 * 代理
	 *
	 * @param string $url
	 * @param int $port
	 */
	public function proxy($url = '', $port = 80)
	{
		$this->option(CURLOPT_HTTPPROXYTUNNEL, TRUE);
		$this->option(CURLOPT_PROXY, $url . ':' . $port);
		return $this;
	}

	/**
	 * 代理登陆
	 *
	 * @param string $username
	 * @param string $password
	 */
	public function proxy_login($username = '', $password = '')
	{
		$this->option(CURLOPT_PROXYUSERPWD, $username . ':' . $password);
		return $this;
	}

	/**
	 * SSL
	 *
	 * @param bool $verify_peer
	 * @param int $verify_host
	 * @param string $path_to_cert
	 */
	public function ssl($verify_peer = TRUE, $verify_host = 2, $path_to_cert = NULL)
	{
		if ($verify_peer)
		{
			$this->option(CURLOPT_SSL_VERIFYPEER, TRUE);
			$this->option(CURLOPT_SSL_VERIFYHOST, $verify_host);
			$this->option(CURLOPT_CAINFO, $path_to_cert);
		}
		else
		{
			$this->option(CURLOPT_SSL_VERIFYPEER, FALSE);
		}
		return $this;
	}

	/**
	 * curl_setopt
	 *
	 * @param mixed $options
	 */
	public function options($options = array())
	{
		foreach ($options as $option_code => $option_value)
		{
			$this->option($option_code, $option_value);
		}

		curl_setopt_array($this->session, $this->options);

		return $this;
	}

	/**
	 * 添加一个option
	 *
	 * @param int $code
	 * @param mixed $value
	 */
	public function option($code, $value)
	{
		if (is_string($code) && !is_numeric($code))
		{
			$code = constant('CURLOPT_' . strtoupper($code));
		}

		$this->options[$code] = $value;
		return $this;
	}

	/**
	 * 开始一个会话
	 *
	 * @param unknown_type $url
	 */
	public function create($url)
	{
		if ( ! preg_match('!^\w+://! i', $url))
		{
			$this->_ci->load->helper('url');
			$url = site_url($url);
		}

		$this->url = $url;
		
		$this->session = curl_init($this->url);

		return $this;
	}

	/**
	 * 执行会话
	 */
	public function execute()
	{
		if ( ! isset($this->options[CURLOPT_TIMEOUT]))
		{
			$this->options[CURLOPT_TIMEOUT] = 30;
		}
		if ( ! isset($this->options[CURLOPT_RETURNTRANSFER]))
		{
			$this->options[CURLOPT_RETURNTRANSFER] = TRUE;
		}
		if ( ! isset($this->options[CURLOPT_FAILONERROR]))
		{
			$this->options[CURLOPT_FAILONERROR] = TRUE;
		}

		if ( ! ini_get('safe_mode') && !ini_get('open_basedir'))
		{
			if ( ! isset($this->options[CURLOPT_FOLLOWLOCATION]))
			{
				$this->options[CURLOPT_FOLLOWLOCATION] = TRUE;
			}
		}

		if ( ! empty($this->headers))
		{
			$this->option(CURLOPT_HTTPHEADER, $this->headers);
		}

		$this->options();

		$this->response = curl_exec($this->session);
		$this->info = curl_getinfo($this->session);

		if ($this->response === FALSE)
		{
			$this->error_code = curl_errno($this->session);
			$this->error_string = curl_error($this->session);
			curl_close($this->session);
			$this->set_defaults();
			//$this->debug();
			return $this->info;
		}
		else
		{
			curl_close($this->session);
			$response = $this->response;
			$this->set_defaults();
			return $response;
		}
	}

	public function is_enabled()
	{
		return function_exists('curl_init');
	}

	public function debug()
	{
		echo "=============================================<br/>\n";
		echo "<h2>CURL Test</h2>\n";
		echo "=============================================<br/>\n";
		echo "<h3>Response</h3>\n";
		echo "<code>" . nl2br(htmlentities($this->response)) . "</code><br/>\n\n";
		if ($this->error_string)
		{
			echo "=============================================<br/>\n";
			echo "<h3>Errors</h3>";
			echo "<strong>Code:</strong> " . $this->error_code . "<br/>\n";
			echo "<strong>Message:</strong> " . $this->error_string . "<br/>\n";
		}
		echo "=============================================<br/>\n";
		echo "<h3>Info</h3>";
		echo "<pre>";
		print_r($this->info);
		echo "</pre>";
	}

	public function debug_request()
	{
		return array(
			'url' => $this->url
		);
	}

	private function set_defaults()
	{
		$this->response = '';
		$this->headers = array();
		$this->options = array();
		$this->error_code = NULL;
		$this->error_string = '';
		$this->session = NULL;
	}

}