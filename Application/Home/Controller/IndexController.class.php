<?php
namespace Home\Controller;

use Think\Controller;

/**
 * 前端首页管理
 * @date: 2015年10月31日
 * @author: Administrator
 * @return:
 */
class IndexController extends CommonController
{

    public function index()
    {
        $this->assign('index', 'active');
        if (!$articles = S('articles')) {
            $articles = M('article a')
                ->field('a.*,ac.*')
                ->where('a_view > 0')
                ->order('a_time desc')
                ->join('left join lt_tag ON lt_tag.t_id = a.pid')
                ->join('left join (select ac_pid,ac_id,ac_rtime,count(*) as ac_num FROM lt_article_c where ac_rtime != 0  GROUP BY ac_pid ) ac ON ac_pid = a.a_id')
                ->limit(0, 8)->select();
            setS("articles", $articles);
        }
//        foreach ($articles as $key => $value) {
//            $imgpath = __ROOT__.$value["a_img"];
//            $articles[$key]["a_img"] = $imgpath;
//        }
        $this->articles = $articles;
        if (!$ppt = S('ppt')) {
            $ppt = M('ppt')->where(array("pp_view" => 1))->order("pp_time desc")->limit(3)->select();
            setS("ppt", $ppt);}
        foreach ($ppt as $key => $value) {
            $imgpath = $value["pp_img"];
            $pp_img = __ROOT__."$imgpath";
            $ppt[$key]["pp_img"] = $pp_img;
        }
        $this->ppt = $ppt;
        $this->display();
    }
}
