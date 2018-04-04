<?php
namespace Home\Controller;
use Think\Controller;
class DownController extends CommonController {
    public function index(){
    	$this->assign('download','active'); 
    	$this->down = M('down')->where("d_static =1")->order('d_time desc')->select();
        $this->display();
    }
	
	public function logs($id){
		if(!IS_AJAX){
			$this->error("非法请求");
		}else{
			$name = M('down')->where("d_id = ".$id."")->getField("d_name");
			$data = array(
				"downname" 	=> $name,
				"downip"	=> get_client_ip(),
				"downtime"	=> time(),
				"downfrom"	=> getOs()
			);
			M('down_log')->add($data);
			M('down')->where("d_id = ".$id."")->setInc('d_sum');
		}
		$this->ajaxReturn(array("error"=>0,"msg"=>"下载次数已加1"));
	}
}