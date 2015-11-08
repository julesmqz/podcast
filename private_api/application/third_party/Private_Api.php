<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

class Private_Api extends REST_Controller {

	public function __construct()
	{
		header('Access-Control-Allow-Origin: *');
		header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
		header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
		$method = $_SERVER['REQUEST_METHOD'];
		if($method == "OPTIONS") {
			die();
		}
		parent::__construct();
		// var_dump( $this->url );
		$this->checkLogin();
	}

	public function checkLogin(){
		$user = $this->session->userdata( 'usr' );
		// var_dump( current_url() );
		if( !isset( $user ) ){
			$this->set_response( array('message' => 'No access allowed.') , REST_Controller::HTTP_UNAUTHORIZED);
			exit();
		}
	}

}
