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
			$r = $q->result_array();
			return $r[0];
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

	public function getRss( $idChannel ){
		$channel = $this->get( $idChannel, 2 );
		$this->load->model('Episode_model','episode');

		$episodes = $this->episode->getByChannel( $idChannel );

		$rss = ['rss' => [] ];
		$rss['rss'] = [
		'_attributes' => ['xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd','xmlns:itunesu'=>'http://www.itunesu.com/feed','version'=>'2.0'],
		'channel' => [
			"title" => $channel['title'],
			"link" => base_url(),
			"language" => $channel['language'],
			"copyright" => $channel['copyright'],
			"itunes:subtitle" => $channel['subtitle'],
			"itunes:author" => $channel['author'],
			"itunes:summary" => $channel['description'],
			"description" => $channel['description'],
			"itunes:owner" => ["itunes:name" => $channel['author'], "itunes:email" => $channel['author_email']],
			"itunes:image" => ["_attributes" => ["href" => "http://example.com/image"] ],
			"itunes:explicit" => $channel['explicit']
		] ];

		foreach ($episodes as $episode ) {
			$audioUrl = base_url("audios/".$episode['fileName']);
			$rss['rss'][] = [
				"title" => $episode['title'],
				"itunes:author" => $episode['author'],
				"itunes:subtitle" => $episode['subtitle'],
				"itunes:summary" => $episode['summary'],
				"enclosure" => [
					"_attributes" => [
						"url" => $audioUrl,
						"length" => round($episode['duration']),
						"type" => "audio/mpeg"
					]
				],
				"guid" => $audioUrl,
				"pubDate" => gmdate("D, d M Y H:i:s T",strtotime($episode['pubDate'])),
				"itunes:duration" => str_replace('.',':',strval(round($episode['duration']/60,2) )),
				"itunes:keywords" => $episode['keywords']
			];
		}
		return $rss;
	}

	public function uploadImage( $name ){
		$config['upload_path']          = './images/';
		$config['allowed_types']        = '*';
		$config['file_name']			= 'image'.date('YmdHis');
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