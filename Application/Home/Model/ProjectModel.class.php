<?php 
namespace Home\Model;
use Think\Model;
class ProjectModel extends Model{
    
    function getProject($id){
        $project = M('project') 
                    ->join('user as u on u.user_id=project.user_id','left')
                    ->join("buildingtype as bt on project.buildingtype=bt.id",'left')
                    ->join("department as d on project.department=d.id",'left')
                    ->join("buildinglevel as bl on project.level='bl.id'",'left')
                    ->where("project.id='$id'")
                    ->field('project.*,u.user_name as user_name,bl.name as buildinglevel,bt.name as buildingtype,d.name as department')
                    ->find();
        
        $p = M("projecttype")
        ->where("projectid='$id'")
        ->join('type as t on t.id=projecttype.typeid','left')
        ->field('t.name')->select();
        $project['projecttype'] = $p;
        $project['user'] = M('projectuser')->where("project_id='".$id."'")
                            ->join("user as u on u.user_id=projectuser.user_id")->field('u.user_id,u.user_name,projectuser.type')
                            ->select();
        
        return $project;
    }
}



?>