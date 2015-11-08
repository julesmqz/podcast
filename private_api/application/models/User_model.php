<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model{
	public function __construct(){
		parent::__construct();
	}

	public function get( $id=0, $active = 1 ){

		/*if( $active <= 1 ){
			$this->db->where('active',$active);
		}*/
		if( $id > 0 ){
			$this->db->where('id',$id);
		}
		$this->db->select('id as rand,user,pretty_name');
		$q = $this->db->get('login');

		// var_dump( $channel_id );

		if( $q->num_rows() === 1 ){
			$r = $q->result_array();
			return $r[0];
		}else if( $q->num_rows() > 0 ){
			return null;
		}
		else{
			return null;
		}
	}

	public function login( $user, $pass ){
		$hashPass = md5($pass);
		$where = array( 'user' => $user, 'pass' => $hashPass );
		$this->db->select('id as rand,user,pretty_name');
		$q = $this->db->get_where( 'login', $where );
		// var_dump($q);
		if( $q->num_rows() === 1 ){
			$r = $q->result_array();
			// $r[0]['rand'] = md5($r[0]['rand']); //is this secure ? :P
			return $r[0];
		}else{
			return null;
		}

		// return null;
	}
}