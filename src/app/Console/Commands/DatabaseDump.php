<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class DatabaseDump extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:dump';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Dump the database';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $dbName = env('DB_DATABASE');
        $dbUser = env('DB_USERNAME');
        $dbPass = env('DB_PASSWORD'); // Ensure your password does not contain special characters that might need to be escaped!
        $filePath = storage_path('app/dump.sql');

        $command = "mysqldump -h mysql -u {$dbUser} -p'{$dbPass}' {$dbName} > {$filePath}";
        system($command);  // Using system() to execute the shell command

        $this->info('Database dump has been created.');
    }
}
