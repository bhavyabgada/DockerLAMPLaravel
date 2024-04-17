<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $includeSSN = rand(0, 1);  // Randomly decide to include SSN

        return [
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'email' => $this->faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'social_security_number' => $includeSSN ? $this->generateValidSSN() : null,
            'role' => 'user',
            'remember_token' => Str::random(10),
        ];
    }

    /**
     * Generate a valid SSN that does not include problematic patterns.
     *
     * @return string
     */
    private function generateValidSSN()
    {
        do {
            $area = $this->faker->numberBetween(1, 899);
            if ($area == 666) {
                $area = $this->faker->numberBetween(1, 665);
            }

            $group = $this->faker->numberBetween(1, 99);
            $serial = $this->faker->numberBetween(1, 9999);

            $ssn = sprintf('%03d-%02d-%04d', $area, $group, $serial);
        } while (in_array($ssn, ['078-05-1120']));  // This SSN is publicly invalid.

        return $ssn;
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}
