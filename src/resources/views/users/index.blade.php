{{-- resources/views/users/index.blade.php --}}
@extends('layouts.app')

@section('content')
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
@if(session('message'))
    <div class="alert alert-success">
        {{ session('message') }}
    </div>
@endif
<div class="container mt-4">
    <h1>Welcome to Nylon</h1>
    <p>Please enter your details:</p>
    <form method="POST" action="{{ route('users.store') }}" class="form-inline justify-content-center">
        @csrf
        <input id="first_name" type="text" class="form-control mb-2 mr-sm-2" name="first_name" required placeholder="First Name" autofocus>

        <input id="last_name" type="text" class="form-control mb-2 mr-sm-2" name="last_name" required placeholder="Last Name">

        <input id="email" type="email" class="form-control mb-2 mr-sm-2" name="email" required placeholder="Email">

        <input id="social_security_number" type="text" class="form-control mb-2 mr-sm-2" name="social_security_number" required placeholder="SSN" pattern="\d{9}" title="SSN must be exactly 9 digits." oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 9);">

        <button type="submit" class="btn btn-primary mb-2">Submit</button>
    </form>
    </form>
</div>

<div class="container mt-4">
    <h1 class="mb-4">User Management</h1>
    @if(session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
    @endif
    <table class="table">
        <thead>
            <tr>
                <th><a href="{{ route('users.index', ['sort' => 'id', 'direction' => $sortBy === 'id' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">ID @if ($sortBy === 'id') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th><a href="{{ route('users.index', ['sort' => 'first_name', 'direction' => $sortBy === 'first_name' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">First Name @if ($sortBy === 'first_name') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th><a href="{{ route('users.index', ['sort' => 'last_name', 'direction' => $sortBy === 'last_name' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">Last Name @if ($sortBy === 'last_name') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th><a href="{{ route('users.index', ['sort' => 'email', 'direction' => $sortBy === 'email' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">Email @if ($sortBy === 'email') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th><a href="{{ route('users.index', ['sort' => 'social_security_number', 'direction' => $sortBy === 'social_security_number' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">SSN @if ($sortBy === 'social_security_number') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th><a href="{{ route('users.index', ['sort' => 'active', 'direction' => $sortBy === 'active' && $sortOrder === 'asc' ? 'desc' : 'asc']) }}">Status @if ($sortBy === 'active') {{ $sortOrder === 'asc' ? '↑' : '↓' }} @endif</a></th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($users as $user)
            <tr>
                <td>{{ $user->id }}</td>
                <td>{{ $user->first_name }}</td>
                <td>{{ $user->last_name }}</td>
                <td>{{ $user->email }}</td>
                <td>{{ '***-**-' . substr($user->social_security_number, -4) }}</td>
                <td>{{ $user->active ? 'Active' : 'Inactive' }}</td>
                <td>
                    <form action="{{ route('users.toggle', $user->id) }}" method="POST">
                        @csrf
                        <button type="submit" class="btn btn-sm {{ $user->active ? 'btn-outline-danger' : 'btn-outline-success' }}" onclick="return confirm('Are you sure you want to change the user status?');">
                            {{ $user->active ? 'Deactivate' : 'Activate' }}
                        </button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <div class="row justify-content-center">
        <div class="col-auto">
            {{ $users->appends(['sort' => $sortBy, 'direction' => $sortOrder])->links('pagination::bootstrap-4') }}
        </div>
    </div>
</div> 
@endsection
