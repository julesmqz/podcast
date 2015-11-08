<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Episode extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Episode_model','episode');
	}

	public function index_get(){
		$channel_id = $this->get('channel_id') ? $this->get('channel_id') : 0;
		$active = $this->get('active') ? $this->get('active') : 1;
		$episodes = $this->episode->getByChannel( $channel_id, $active );

		if( $episodes != null ){
			$this->set_response($episodes, REST_Controller::HTTP_OK);
		}else{
			$this->set_response(null, REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function index_post(){
		$episode = $this->episode->create( $this->post() );
		if( $episode != null ){
			$this->set_response($episode, REST_Controller::HTTP_CREATED);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function index_put(){
		$episode = $this->episode->update( $this->put() );
		if( $episode != null ){
			$this->set_response($episode, REST_Controller::HTTP_OK);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_NOT_MODIFIED);
		}
	}

	public function audio_post(){
		$audio = $this->episode->upload( 'audio' );
		// $this->set_response($audio, REST_Controller::HTTP_OK);
		if( $audio['error'] === null ){
			$this->set_response($audio, REST_Controller::HTTP_OK);
		}
		else{
			$this->set_response($audio, REST_Controller::HTTP_BAD_REQUEST);
		}
	}
}
