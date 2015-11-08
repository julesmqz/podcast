<?php
class Rss_Cronjob extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('Channel_model','channel');
		$this->load->model('Episode_model','episode');
	}

	public function create( $channelId=0 ){
		if( is_numeric($channelId) && ($channelId > 0) ){
			$xml = '<?xml version="1.0" encoding="utf-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:itunesu="http://www.itunesu.com/feed" version="2.0">';
			echo "Requesting channel info for ".$channelId.PHP_EOL;
			$channel = $this->channel->get( $channelId );

			$xml .= '<channel><title>'.$channel['title'].'</title>';
			$xml .= '<link>'.base_url().'</link>';
			$xml .= '<language>'.$channel['language'].'</language>';
			$xml .= '<copyright>'.$channel['copyright'].'</copyright>';
			$xml .= '<itunes:subtitle>'.$channel['subtitle'].'</itunes:subtitle>';
			$xml .= '<itunes:author>'.$channel['author'].'</itunes:author>';
			$xml .= '<itunes:summary>'.$channel['description'].'</itunes:summary>';
			$xml .= '<description>'.$channel['description'].'</description>';
			$xml .= '<itunes:owner><itunes:name>'.$channel['author'].'</itunes:name>';
			$xml .= '<itunes:email>'.$channel['author_email'].'</itunes:email></itunes:owner>';
			$xml .= '<itunes:image href="'.base_url('images/'.$channel['image']).'" />';
			$xml .= '<itunes:explicit>'.$channel['explicit'].'</itunes:explicit>';

			echo "Requesting episodes for channel ".$channel['title'].PHP_EOL;
			$episodes = $this->episode->getByChannel( $channelId );

			foreach ($episodes as $episode) {
				$xml .= '<item>';
				$xml .= '<title>'.$episode['title'].'</title>';
				$xml .= '<itunes:author>'.$episode['author'].'</itunes:author>';
				$xml .= '<itunes:subtitle>'.$episode['subtitle'].'</itunes:subtitle>';
				$xml .= '<itunes:summary>'.$episode['summary'].'</itunes:summary>';
				$xml .= '<enclosure url="'.base_url('audios/'.$episode['fileName']).'" length="'.round($episode['duration']).'" type="audio/x-m4a" />';
				$xml .= '<guid>'.base_url('audios/'.$episode['fileName']).'</guid>';
				$xml .= '<pubDate>'.$episode['pubDate'].'</pubDate>';
				$xml .= '<itunes:duration>'.$episode['duration'].'</itunes:duration>';
				$xml .= '<itunes:keywords>'.$episode['keywords'].'</itunes:keywords>';
				$xml .= '</item>';
			}

			$xml .= '</channel></rss>';

			$realXml = simplexml_load_string( $xml );

			$channelName = date('YmdHis');

			// Header('Content-type: text/xml');
			$realXml->asXML('../rss/'.$channelName.'.xml');

			// $update = array('channel_rss' => $channelName.'.xml');
			$channel['channel_rss'] = $channelName.'.xml';
			$this->channel->update($channel);

			echo "File written".PHP_EOL;

			return true;
		}else{
			echo "Not a valid channelId ".$channelId.PHP_EOL;
			return false;
		}
		
	}
}