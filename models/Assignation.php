<?php
class Assignation{
    protected $as_lb_g_id;
	protected $as_lb_bk_id;
	protected $as_u_rn;
    protected $as_vr_id;
    protected $as_p_id;
    protected $db;

	public function __construct($db){
        if($this->db===null){
            $this->db=$db;
        }
	}

	public function getAllAssignation(){
		$res=$this->db->query("SELECT * FROM assign");
		return $res->fetchAll();
	}

	public function getAsstignation($id){        
		$req= $this->db->prepare("SELECT * FROM assign WHERE as_lb_g_id=:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch();
	}
}
?>