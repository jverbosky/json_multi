users = [
  {
    "user_name" => "Abby",
    "user_age" => "20",
    "num_1" => "2",
    "num_2" => "4",
    "num_3" => "6"
  },
  {
    "user_name" => "Bobby",
    "user_age" => "30",
    "num_1" => "3",
    "num_2" => "6",
    "num_3" => "9"
  },
  {
    "user_name" => "Cassy",
    "user_age" => "40",
    "num_1" => "4",
    "num_2" => "8",
    "num_3" => "12"
  },
  {
    "user_name" => "Danny",
    "user_age" => "50",
    "num_1" => "5",
    "num_2" => "10",
    "num_3" => "15"
  }
]

p users[0]["user_name"]  # "Abby"
p users[-1]["user_name"]  # "Danny"