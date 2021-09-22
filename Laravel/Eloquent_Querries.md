Eloquent Querries review

* Query with **or** condition 
$imgCats = ImageCategory::where(['tagName' => 'frontGalery'])
                                ->orWhere(['tagName' => 'certificates'])
                                ->orWhere(['tagName' => 'slider'])->get();
                                
* Query **Count(*) group by**
$projectsStatus = DB::table('projects')
                        ->select('projectStatus', DB::raw('count(*) as total'))
                        ->groupBy('projectStatus')
                        ->pluck('total','projectStatus')->all();

	// printing the array
    $totalProjects=0;
    foreach($projectsStatus as $key => $value){
        error_log('->Projects is : '.$key.' -value '.$value);
        $totalProjects+=$value;
    }   
    
* Query By **Relationship ManyToOne or OneToMany**
$certificates = Gallery::where(['com_id' =>$company->companyId])
                        ->with('imageCategory')
                        ->whereHas('imageCategory', function($query)  {// use ($term)
                        $query->where('tagName', 'certificates');
                        })->Where(['status' => true])->get();
                        
* Reltionship between three Models or entities:

| User        	| UserRoles     | UserServices  | Services  |
| ------------- |:-------------:| -------------:| ---------:|
| id      		| id 			| id 			| id 		|
| user_roles_id	| name 			| user_id 		| title 	|
| 			    | right-aligned | services_id 	|  			|

```php
**User**
	// creating Many-To-One relation with the users UserRoles table 
    public function userRole(){
        
        return $this->belongsTo('App\Models\AppModels\UserRoles', 'id');
    }

    // creating One-To-Many relation with the UsersServices table 
    public function userServices(){
        return $this->hasMany('App\Models\AppModels\UserServices');
    }  
    
**UserRoles**
	// creating One-To-Many relation with the users Gallery table 
    public function users(){
        return $this->hasMany('App\User');
    }
    
**UserServices**
	// creating Many-To-One relation with the User table 
    public function user(){
        
        return $this->belongsTo('App\User');
    }

    // creating Many-To-One relation with the users UserRoles table 
    public function services(){
        
        return $this->belongsTo('App\Models\AppModels\Services');
    }
```
It is to be noted that for Many-To-One relationship between User *-->1 UserRoles we have used belongs to in Users model. 
```php
public function userRole(){
    
    return $this->belongsTo('App\Models\AppModels\UserRoles', 'id');
}
```
In this case we have used *'id'* in the second parameter to map the user_roles_id column to *id* column of *UsserRoles* table.




                     
