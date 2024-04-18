@extends('layouts.app')

@section('content')
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
@endsection
