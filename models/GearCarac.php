<?php 
class GearCarac{
    protected $gc_id;
	protected $gc_gct_id;
	protected $gc_gb_id;
	protected $gc_nb_place;
	protected $gc_photo;
	protected $gc_model;
    protected $db;

	public function __construct($db){
		if($this->db===null){
            $this->db=$db;
        }
	}

	public function getAllGearCarac(){
		$res=$this->db->query("SELECT gc.gc_id as gearCarId, gct.gct_category, gb.gb_brand, gc.gc_nb_place, gc.gc_photo, gc.gc_model FROM gear_car gc, gear_cat gct, gear_brand gb WHERE gc.gc_gct_id =gct.id AND gc.gc_gb_id=gb.gb_id ");
		return $res->fetchAll();
	}

	public function getGearCarac(int $id){        
		$req= $this->db->prepare("SELECT gc.gc_id as gearCarId, gct.gct_category, gb.gb_brand, gc.gc_nb_place, gc.gc_photo, gc.gc_model FROM gear_car gc, gear_cat gct, gear_brand gb WHERE gc.gc_gct_id =gct.id AND gc.gc_gb_id=gb.gb_id AND gc_id=:id");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();
        return $req->fetch();
	}
}
?>