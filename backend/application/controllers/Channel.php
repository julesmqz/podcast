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
		$active = $this->get('active') ? $this->get('active') : 1;
		$channels = $this->channel->get( $channel_id, $active );

		if( $channels != null ){
			$this->set_response($channels, REST_Controller::HTTP_OK);
		}else{
			$this->set_response(null, REST_Controller::HTTP_NOT_FOUND);
		}
	}

	public function index_post(){
		$channel = $this->channel->create( $this->post() );
		if( $channel != null ){
			$this->set_response($channel, REST_Controller::HTTP_CREATED);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function index_put(){
		$channel = $this->channel->update( $this->put() );
		if( $channel != null ){
			$this->set_response($channel, REST_Controller::HTTP_OK);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_NOT_MODIFIED);
		}
	}

	public function rss_get(){
		$channel = $this->channel->getRss( $this->get('id') );
		if( $channel != null ){
			$this->set_response($channel, REST_Controller::HTTP_OK);
		}
		else
		{
			$this->set_response(null, REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function image_post(){
		$img = $this->channel->uploadImage('image');
		if( $img['error'] === null ){
			$post = $this->post();
			$post['image'] = $img['data']['file_name'];
			// $this->set_response($post, REST_Controller::HTTP_OK);
			// ( var_dump($post) );
			$channel = $this->channel->update( $post );
			if( $channel != null ){
				$this->set_response($channel, REST_Controller::HTTP_OK);
			}
			else
			{
				$this->set_response(null, REST_Controller::HTTP_NOT_MODIFIED);
			}
		}
		else{
			$this->set_response($img, REST_Controller::HTTP_BAD_REQUEST);
		}
	}
}
