<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Create a new controller instance with auth middleware
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except(['store']); 
           
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sortBy = $request->query('sort', 'id');
        $sortOrder = $request->query('direction', 'asc') === 'asc' ? 'asc' : 'desc';
    
        $users = User::where('role', '<>', 'admin')
                     ->orderBy($sortBy, $sortOrder)
                     ->paginate(5);
    
        return view('users.index', compact('users', 'sortBy', 'sortOrder'));
    }

    /**
     * Toggle user active status
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function toggleActive(User $user)
    {
        $user->active = !$user->active;
        $user->save();

        return redirect()->route('users.index')->with('status', 'User status updated successfully!');
    }
    
    /**
     * Accept the custom request of firstname lastname email and ssn and store it in the database
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|unique:users',
            'social_security_number' => 'required|digits:9',
        ]);

        $user = new User();
        $user->first_name = $data['first_name'];
        $user->last_name = $data['last_name'];
        $user->email = $data['email'];
        $user->social_security_number = $data['social_security_number'];
        $user->save();

        if (auth()->check() && auth()->user()->role == 'admin') {
            return redirect()->route('users.index')->with('status', 'User created successfully!');
        }

        return redirect()->route('home')->with('status', 'User created successfully! You need to log in to make them active/inactive.');
    }
}
