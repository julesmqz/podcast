<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

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
		$this->load->model('User_model','user');
		$this->checkLogin();
	}

	public function index_post()
	{
		$user = $this->user->login($this->post('user'),$this->post('pass'));

		if( $user != null ){
			$this->session->set_userdata( 'usr', $user );
			$session_id = $this->session->userdata('usr');
			$this->set_response(array('session_id' => $session_id), REST_Controller::HTTP_OK);
		}else{
			$this->set_response(null, REST_Controller::HTTP_BAD_REQUEST);
		}
        
	}

	public function check_get(){
		$user = $this->session->userdata( 'usr' );
		// var_dump( current_url() );
		if( isset( $user ) ){
			$this->set_response($user, REST_Controller::HTTP_OK);
		}else{
			$this->set_response( null , REST_Controller::HTTP_BAD_REQUEST);
		}
	}

	public function destroy_get(){
		$this->session->set_userdata( 'usr', null );
		$this->set_response(array('success' => true), REST_Controller::HTTP_OK);
	}
}
