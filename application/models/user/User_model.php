<?php
class User_model extends CI_Model {

    
    public $tablename="ll_user";

    public function __construct()
    {
    // Call the CI_Model constructor
      parent::__construct();
	  $this->load->library('Curl');
	  $this->user_api_url="http://192.168.8.29:8080";
    }
    //登录
    function checkLogin($data){
        $url=$this->user_api_url."/user/login";	
		$return=$this->curl->_simple_call('post',$url,$data);
        return $return;
    }
    
   
    
    //更新最后登录时间
    function upLoginTime($userId,$time){
        $arr=array('lastLoginTime'=>$time);
        $this -> db -> where('userId', $userId); 
        $this -> db -> update($this->tablename, $arr);
    }
    
    //添加用户
    function addUser($arr){
        $this->isLogin($arr['creatUserId']);
        if($this->checkUserName($arr['userName'])){
            $data = array(
                'userName' => $arr['userName'],
                'creatUserId' => $arr['creatUserId'],
                'pwd' => md5($arr['pwd']),
                'status' => 1,
                'roleId' => $arr['roleId'],
                'groupId' => $arr['groupId'],
                'creatTime' => time()
            );
            $this->db->insert($this->tablename, $data);
            $return['msgCode']=1;
            $return['msg']='添加成功';
            return $return;
        }
        else{
            $return['msgCode']=0;
            $return['msg']='添加失败用户名重复';
            return $return;
        }
    }
    
    //添加用户组
    function addUserGroup($arr){
        $data = array(
            'groupName' => $arr['groupName'],
            'creatUserId' => $arr['creatUserId']
        );
        $this->db->insert('ll_user_group', $data);
    }
    
    //根据用户组批量添加用户
    function addUsers($groupId,$nums,$creatUserId){
        if (!$groupId){
            $return['msgCode']=1001;
            $return['msg']='组ID为空';
        }
        $group=$this->getUserGroup($groupId);
        $start=$this->getUserNameNoByGroupId($groupId);
        for ($i=$start;$i<=$nums;$i++){
            $arr['userName']=$group->groupName.'_'.$i;
            $arr['pwd']='123456';
            $arr['groupId']=$groupId;
            $arr['roleId']=2;
            $arr['creatUserId']=$creatUserId;
            $this->addUser($arr);
        }
    }
    
    //根据ID获取用户组信息
    function getUserGroup($groupId){
        $sql="SELECT * FROM ll_user_group WHERE groupId='".$groupId."'";
        $query=$this->db->query($sql);
       return  $row = $query->row();
    }
    
    //
    function getUserListByGroup(){
        $sql="SELECT * FROM ll_user_group ";
        $query=$this->db->query($sql);
        $list = $query->result_array();
        foreach ($list as $key=>$value){
            $list[$key]['userList']=$this->getUserListByGroupId($value['groupId']);
        }
        $return['msgCode']=0;
        $return['msg']='获取数据成功';
        $return['data']=$list;
        return $return;
    }
    
    //判断用户名是否重复
    function checkUserName($userName){
        $sql="SELECT * FROM {$this->tablename} WHERE username='".$userName."'";
        $query=$this->db->query($sql);
        $num=$query->num_rows();
        if($num>0){
            return false;
        }
        else {
            return true;
        }
    }
    
    //根据用户ID获取用户信息
    function getUserInfo($userId){
        $sql="SELECT * FROM {$this->tablename} WHERE userId='".$userId."'";
        $query=$this->db->query($sql);
        return $row = $query->row();
    }
    
    //根据组获取用户列表
    function getUserListByGroupId($groupId){
        $sql="SELECT * FROM {$this->tablename} WHERE groupId='".$groupId."' ORDER BY creattime DESC";
        $query=$this->db->query($sql);
        $list=$query->result_array();
        return $list;
    }
    
    //获取当前用户组最近的用户编号
    function getUserNameNoByGroupId($groupId){
        $list=$this->getUserListByGroupId($groupId);
        $arr=explode($list[0]['userName'],'_');
        if($arr[1]){
            return $arr[1];
        }
        else {
           return 1;
        }
    }
    
    //判断是否登录
    function checkAuth($data){
        $userInfo=$this->getUserInfo($data['userId']);
        if(isset($userInfo->userId)){
            if($userInfo->lastLoginTime==$data['lastLoginTime']){
                if(time()>($userInfo->lastLoginTime+24*3600)){
                    $return['msgCode']=1001;
                    $return['msg']='登录过期请重新登录';
                    
                }
                else{
                    $return['msgCode']=0;
                    $return['msg']='通过验证';
                }
            }
            else{
                $return['msgCode']=1003;
                $return['msg']='该账户无授权';
                
            }
        }
        else {
            $return['msgCode']=1002;
            $return['msg']='无此账号';
        
        }

        return $return;
        
    }
}
?>