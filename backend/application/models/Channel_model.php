<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Channel_model extends CI_Model{
	public function __construct(){
		parent::__construct();
	}

	public function get( $id, $active = 1 ){
		if( $id > 0 ){
			$this->db->where('id',$id);
		}

		if( $active <= 1 ){
			$this->db->where('active',$active);
		}
		$q = $this->db->get('channel');

		if( $q->num_rows() === 1 ){
			return $q->result_array()[0];
		}if( $q->num_rows() > 0 ){
			return $q->result_array();
		}
		else{
			return null;
		}
	}

	public function create( $channel ){
		$this->db->insert('channel',$channel);

		$id = $this->db->insert_id();

		return $this->get( $id );
	}

	public function update( $channel ){
		$id = $channel['id'];
		unset( $channel['id'] );

		$this->db->where('id',$id );
		$this->db->update('channel',$channel);
		//return $id;
		return $this->get( $id, 2 );
	}
}