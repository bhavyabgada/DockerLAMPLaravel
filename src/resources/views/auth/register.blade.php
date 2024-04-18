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

<div class="container mt-4">
    <h1>Register</h1>
    <p>Please enter your details:</p>
    <form method="POST" action="{{ route('register') }}" class="form-inline justify-content-center">
        @csrf
        <input id="name" type="text" class="form-control mb-2 mr-sm-2" name="name" required placeholder="Name" autofocus>

        <input id="email" type="email" class="form-control mb-2 mr-sm-2" name="email" required placeholder="Email">

        <input id="password" type="password" class="form-control mb-2 mr-sm-2" name="password" required placeholder="Password">

        <input id="password-confirm" type="password" class="form-control mb-2 mr-sm-2" name="password_confirmation" required placeholder="Confirm Password">

        <button type="submit" class="btn btn-primary mb-2">Register</button>
    </form>
</div>
@endsection
