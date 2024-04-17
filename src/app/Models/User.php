<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Hash;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'first_name', 
        'last_name', 
        'email', 
        'password', 
        'social_security_number', 
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'social_security_number',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Set the user's social security number.
     *
     * @param  string  $value
     * @return void
     */
    public function setSocialSecurityNumberAttribute($value)
    {
        $this->attributes['social_security_number'] = encrypt($value);
    }

    /**
     * Get the user's social security number.
     *
     * @param  string  $value
     * @return string
     */
    public function getSocialSecurityNumberAttribute($value)
    {
        return decrypt($value);
    }
    
    /**
     * Set the password attribute, auto-formatting based on name fields.
     *
     * @param  string  $value
     * @return void
     */
    public function setPasswordAttribute($value)
    {
        // Check if value is already given and not empty, if so, use it directly.
        if (!empty($value)) {
            $this->attributes['password'] = Hash::make($value);
        } else {
            // Create password from last name and the first letter of the first name capitalized.
            if (!empty($this->last_name) && !empty($this->first_name)) {
                $formattedPassword = $this->last_name . ucfirst($this->first_name[0]);
                $this->attributes['password'] = Hash::make($formattedPassword);
            }
        }
    }

}
