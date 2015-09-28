<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Channel extends MY_Controller {

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
		$this->load->model('Channel_model','channel');
	}

	public function index_get(){
		$channel_id = $this->get('id') ? $this->get('id') : 0;
		$active = $this->get('id') ? $this->get('active') : 1;
		$channels = $this->channel->get( $channel_id, $active );

		if( $channels != null ){
			$this->set_response($channels, REST_Controller::HTTP_OK);
		}else{
			$this->set_response(null, REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function index_put(){
		$channel = $this->channel->create( $this->put() );
		if( $channel != null ){
			$this->set_response($channel, REST_Controller::HTTP_CREATED);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function index_post(){
		$channel = $this->channel->update( $this->post() );
		if( $channel != null ){
			$this->set_response($channel, REST_Controller::HTTP_OK);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_NOT_MODIFIED);
		}
	}
}
