@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h1>Welcome to Nylon</h1>
    <p>Please enter your details:</p>
    <form method="POST" action="/submit-form" class="form-inline justify-content-center">
        @csrf
        <input id="first_name" type="text" class="form-control mb-2 mr-sm-2" name="first_name" required placeholder="First Name" autofocus>

        <input id="last_name" type="text" class="form-control mb-2 mr-sm-2" name="last_name" required placeholder="Last Name">

        <input id="email" type="email" class="form-control mb-2 mr-sm-2" name="email" required placeholder="Email">

        <input id="ssn" type="text" class="form-control mb-2 mr-sm-2" name="ssn" required placeholder="SSN" pattern="\d{3}-\d{2}-\d{4}">

        <button type="submit" class="btn btn-primary mb-2">Submit</button>
    </form>
</div>
@endsection
