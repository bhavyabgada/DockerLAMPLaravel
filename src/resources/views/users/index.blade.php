{{-- resources/views/users/index.blade.php --}}
@extends('layouts.app')

@section('content')
<div class="container mt-4">
    <h1 class="mb-4">User Management</h1>
    @if(session('status'))
        <div class="alert alert-success">
            {{ session('status') }}
        </div>
    @endif
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>SSN</th>
                <th>Role</th>
                <th>Status</th>
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
                <td>{{ '***-**-' . substr($user->social_security_number, -4) }}</td> {{-- Masked for privacy --}}
                <td>{{ $user->role }}</td>
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
            {{ $users->appends(request()->query())->links() }}
        </div>
    </div>
</div>  
@endsection
