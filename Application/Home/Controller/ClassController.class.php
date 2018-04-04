<?php
namespace Home\Controller;
use Think\Controller;
/**
* 文章类管理
* @date: 2015年10月31日
* @author: Administrator
* @return:
*/
class ClassController extends CommonController {

    public function _before_index(){
        $id = I('get.id');
		if(!M('tag')->where(array("t_id"=>$id,"t_view"=>1))->find()){
			$this->error("不存在的栏目!");
		}
    }

    public function index(){
	  	$this->assign('class','active');
        $id = I('get.id');
		$tmp = M('article a');
        $where['a_view'] = array('gt',0);
        $where['pid']= array('eq',I('get.id'));
        $count = $tmp->where($where)->count();
        $Page  = new \Think\PageHome($count,5);
        $Page->url = 'class-'.$id.'/page';
        $show  = $Page->show();
        $article = $tmp
        ->field('a.*,ac.*,t.*')
        ->order('a_time desc')
        ->join('left join lt_tag t ON t.t_id = a.pid')
        ->join('left join (select ac_pid,ac_id,ac_rtime,count(*) as ac_num FROM lt_article_c where ac_rtime != 0  GROUP BY ac_pid ) ac ON ac.ac_pid = a.a_id')
        ->where($where)
        ->limit($Page->firstRow.','.$Page->listRows)
        ->select();
        $this->assign('article',$article);
        $this->assign('page',$show);
        $this->display();

    }

    public function search($key=''){
	    $this->assign('class','active');
        $key = I('get.key');
		$tmp = M('article a');
        $map['a_title']=array('like',"%$key%");
        $map['a_view']=array('gt','0');
        $count = $tmp->where($map)->count();
        $Page  = new \Think\PageHome($count,5);
        foreach($map as $key=>$val) {
            $Page->parameter[$key]   =   urlencode($val);
        }
        $show  = $Page->show();
        $article = $tmp
        ->where($map)
        ->field('a.*,ac.*,t.*')
        ->order('a_time desc')
        ->join('left join lt_tag t ON t.t_id = a.pid')
        ->join('left join (select ac_pid,ac_id,ac_rtime,count(*) as ac_num FROM lt_article_c where ac_rtime != 0  GROUP BY ac_pid ) ac ON ac.ac_pid = a.a_id')
        ->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('article',$article);
        $this->assign('page',$show);
        $this->display();
    }
}
