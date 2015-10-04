<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model{
	public function __construct(){
		parent::__construct();
	}

	public function login( $user, $pass ){
		$hashPass = md5($pass);
		$where = array( 'user' => $user, 'pass' => $hashPass );
		// var_dump($hashPass);
		$q = $this->db->get_where( 'login', $where );
		// var_dump($q);
		if( $q->num_rows() === 1 ){
			$r = $q->result_array();
			return $r[0];
		}else{
			return null;
		}

		// return null;
	}
}