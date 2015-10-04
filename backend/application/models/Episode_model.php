<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Episode_model extends CI_Model{
	public function __construct(){
		parent::__construct();
	}

	public function getByChannel( $channel_id, $active = 1 ){

		if( $active <= 1 ){
			$this->db->where('active',$active);
		}
		$this->db->where('channel_id',$channel_id);
		$q = $this->db->get('episode');

		// var_dump( $channel_id );

		if( $q->num_rows() === 1 ){
			$r = $q->result_array();
			return $r[0];
		}if( $q->num_rows() > 0 ){
			return $q->result_array();
		}
		else{
			return null;
		}
	}

	public function get( $id, $active = 1 ){

		if( $active <= 1 ){
			$this->db->where('active',$active);
		}
		$this->db->where('id',$id);
		$q = $this->db->get('episode');

		// var_dump( $channel_id );

		if( $q->num_rows() === 1 ){
			$r = $q->result_array();
			return $r[0];
		}if( $q->num_rows() > 0 ){
			return null;
		}
		else{
			return null;
		}
	}

	public function create( $episode ){
		$this->db->insert('episode',$episode);

		$id = $this->db->insert_id();

		return $this->get( $id );
	}

	public function update( $episode ){
		$id = $episode['id'];
		unset( $episode['id'] );

		$this->db->where('id',$id );
		$this->db->update('episode',$episode);
		//return $id;
		return $this->get( $id, 2 );
	}

	public function upload( $name ){
		$config['upload_path']          = './audios/';
		$config['allowed_types']        = '*';
		$config['file_name']			= 'audio'.date('YmdHis');
		// $config['max_size']             = 8000;

		$this->load->library('upload', $config);

		if ( ! $this->upload->do_upload( $name ) )
		{
			return array('error' => $this->upload->display_errors(), 'data' => null );
			// $this->load->view('upload_form', $error);
		}
		else
		{	
			// return array('error' => null, 'data' => 'cool');
			return array('error' => null, 'data' => $this->upload->data() );
		}
	}
}