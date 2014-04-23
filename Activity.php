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
	protected $activityDate; 
	protected $venueName; 
	
	public function __construct($id, $name, $cost, $city, $state, $zip, $locationType, $popularityIndex, $description, $activityDate, $venueName)
	{
		$this->id = $id; 
		$this->name = $name; 
		$this->cost = $cost; 
		$this->city = $city; 
		$this->state = $state;
		$this->zip = $zip; 
		$this->locationType = $locationType; 
		$this->popularityIndex = $popularityIndex; 
		$this->description = $description; 
		$this->activityDate = $activityDate; 
		$this->venueName = $venueName; 
	}

	public function __get($name)
	{
		return $this->$name; 
	}
	
	public function __set($name, $value) 
	{
		if(isset($name) && $name == "Id")
			$this->id = $value;	
		else if (isset($name) && $name == "Name")
			$this->name = $value; 
		else if (isset($name) && $name == "Cost")
			$this->cost = $value; 		
		else if (isset($name) && $name == "City")
			$this->city = $value; 		
		else if (isset($name) && $name == "State")
			$this->state = $value; 	
		else if (isset($name) && $name == "Zip")
			$this->zip = $value; 	
		else if (isset($name) && $name == "LocationType")
			$this->locationType = $value; 	
		else if (isset($name) && $name == "PopularityIndex")
			$this->popularityIndex = $value;
		else if (isset($name) && $name == "Description")
			$this->description = $value;
		else if (isset($name) && $name == "ActivityDate")
			$this->activityDate = $value;
		else if (isset($name) && $name == "VenueName")
			$this->venueName = $value;
	}
	
	public function getValue ()
	{
		echo "{id:" .$this->id. ", name: " .$this->name. ", cost:" .$this->cost. ", city: " .$this->city.
		", state: " .$this->state. ", zip: " .$this->zip. ", locationType: " .$this->locationType.
		", Popularity: " .$this->popularityIndex. ", description: " .$this->description.
		", activityDate: " .$this->activityDate.", venueName: " .$this->venueName.  "}";
		
	}
}

?>