<?php

class Activity 
{
	protected $id;
	protected $name;
	protected $cost; 
	protected $city;
	protected $state; 
	protected $zip; 
	protected $locationType; 
	protected $popularityIndex;
	protected $description; 
	protecteed $venueName; 
	
	function __construct($id, $name, $cost, $city, $state, $zip)
	{
		if(isset($id) && isset($name) && isset($cost) && isset($city) && isset($state) && isset($zip)
		{
			$this->$id = $id; 
			$this->$name = $name; 
			$this->$cost = $cost; 
			$this->$city = $city; 
			$this->$state = $state;
			$this->$zip = $zip; 
		}
	}
	
	function __get($id)
	{
		return $this->$id; 
	}

	function __get($name)
	{
		return $this->$name; 
	}
	
	function __get($cost)
	{
		return $this->$cost; 
	}
	
	function __get($city)
	{
		return $this->$city; 
	}
	
	function __get($state)
	{
		return $this->$state; 
	}
	
	function __get($zip)
	{
		return $this->$zip; 
	}
	
	function __set($name, $value) 
	{
		if($name == "id")
			$this->$id = $value;	
		else if ($name == "name")
			$this->$name = $value; 
		else if ($name == "cost")
			$this->$name = $value; 		
		else if ($name == "city")
			$this->$name = $value; 		
		else if ($name == "state")
			$this->$name = $value; 	
		else if ($name == "zip")
			$this->$name = $value; 	
		else if ($name == "locationType")
			$this->$name = $value; 	
		else if ($name == "popularityIndex")
			$this->$name = $value;
		else if ($name == "description")
			$this->$name = $value;
		else if ($name == "venueName")
			$this->$name = $value;
	}
	
	function getValue ()
	{
		echo '{Id:' .$this->$id. ', Name: ' .$this->$name. ', Cost:' .$this->$cost. ', City: ' .$this->$city.
		', State: ' .$this->$state. ', Zip: ' .$this->$zip. ', LocationType: ' .$this->$locationType.
		', Popularity: ' .$this->$popularityIndex. ', Description: ' .$this->$description.
		', VenueName: ' .$this->$venueName. '}'
		
	}

}



?>