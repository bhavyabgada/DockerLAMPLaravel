{{-- resources/views/auth/login.blade.php --}}

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
    <h1>Login</h1>
    <p>Please enter your credentials:</p>
    <form method="POST" action="{{ route('login') }}" class="form-inline justify-content-center">
        @csrf
        <input id="email" type="email" class="form-control mb-2 mr-sm-2" name="email" required placeholder="Email" autofocus>

        <input id="password" type="password" class="form-control mb-2 mr-sm-2" name="password" required placeholder="Password">

        <button type="submit" class="btn btn-primary mb-2">Login</button>
    </form>
</div>
@endsection

