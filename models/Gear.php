<?php 
class Gear{
    protected $g_id;
	protected $g_year;
	protected $g_gc_id;
    protected $db;

	public function __construct($db){
		if($this->db===null){
            $this->db=$db;
        }
	}

	public function getGears(){
		$res=$this->db->query("SELECT DISTINCT g.g_id as gearId, g.g_year, gc.gc_id as gearCarId, gc.gc_nb_place, gc.gc_photo, gc.gc_model, gct.gct_category, gb.gb_brand FROM gear g JOIN gear_car gc ON g.g_gc_id=gc.gc_id JOIN gear_cat gct ON gc.gc_gct_id=gct.gct_id JOIN gear_brand gb ON gc.gc_gb_id=gb.gb_id");
		return $res->fetchAll();
	}

	public function getGear($id){        
		$req= $this->db->prepare("SELECT DISTINCT g.g_id as gearId, g.g_year, gc.gc_nb_place, gc.gc_photo, gc.gc_model, gct.gct_category, gb.gb_brand FROM gear g JOIN gear_car gc ON g.g_gc_id=gc.gc_id JOIN gear_cat gct ON gc.gc_gct_id=gct.gct_id JOIN gear_brand gb ON gc.gc_gb_id=gb.gb_id WHERE g.g_id=:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch();
	}

	//GETTER
	public function getG_id():int{
		return $this->g_id;
	}
	
	public function getG_year(){
		return $this->g_year;
	}

	public function getG_gc_id(){
		return $this->g_gc_id;
	}
}
?>