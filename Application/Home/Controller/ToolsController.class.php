<?php
namespace Home\Controller;
use Think\Controller;
class ToolsController extends CommonController {
    public function index(){
        $this->display();
    }
	
	public function str(){
		$this->display();
	}
	public function md5(){
		$this->display();
	}
	public function unix(){
		$this->display();
	}
	public function music(){
		$this->display();
	}
	public function seo(){
	//echo "需要提交时，请修改源代码";die;
		$res = M('article')->where("a_view > 0")->getField('a_id',true);
		for($i=0;$i<count($res);$i++){
			$urls[] = 'http://www.loveteemo.com/article-'.$res[$i].'.html';
		}
	    $api = 'http://data.zz.baidu.com/urls?site=www.loveteemo.com&token=khVlYsBQtnXPcV36';
	    $ch = curl_init();
	    $options =  array(
	        CURLOPT_URL => $api,
	        CURLOPT_POST => true,
	        CURLOPT_RETURNTRANSFER => true,
	        CURLOPT_POSTFIELDS => implode("\n", $urls),
	        CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
	    );
	    curl_setopt_array($ch, $options);
	    $result = curl_exec($ch);
	    $this->assign("seo",json_encode($result));
		$this->display();
	}
	
    public function machine(){
		$this->display();
    }

    public function a_num(){
    	$info = M('article_c')->order('ac_pid')->getField('ac_pid',true);
    	dump($info);
    }
}