<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

class MY_Controller extends REST_Controller {

	public function __construct()
	{
		parent::__construct();
		// var_dump( $this->url );
		$this->checkLogin();
	}

	public function checkLogin(){
		$url = current_url();
		$allowedWords = ['login','rss'];
		$check = null;
		foreach ($allowedWords as $word ) {
			if( strstr($url, $word ) != null ) {
				$check = true;
			}
		}
		
		
		if( $check == null ){
			$user = $this->session->userdata( 'usr' );
			// var_dump( current_url() );
			if( !isset( $user ) ){
				$this->set_response( array('message' => 'No access allowed.') , REST_Controller::HTTP_UNAUTHORIZED);
				exit();
			}
		}
	}

}
