FactoryBot.define do
  factory :user do
    first_name { "Николай" }
    last_name { "Алексеев" }
    email { "test@te.st" }
    password { "password" }  
    hired_date { "2010.01.01" }
  end

  factory :alekseev, parent: :user do
    first_name { "Николай" }
    last_name { "Алексеев" }
    email { "test0@te.st" }
    password { "password" } 
    hired_date { "2019.03.18" } 
  end

  factory :natalia, parent: :user do
    first_name { "Наталья" }
    last_name { "Канцырева" }
    email { "test1@te.st" }
    password { "password" }  
    hired_date { "2018.12.01" }
  end

  factory :natasha, parent: :user do
    first_name { "Наталия" }
    last_name { "Тванкова" }
    email { "test2@te.st" }
    password { "password" }  
    hired_date { "2019.05.17" }
  end

  factory :masha, parent: :user do
    first_name { "Мария" }
    last_name { "Самохвалова" }
    email { "test3@te.st" }
    password { "password" }
    hired_date { "2019.03.18" }  
  end

  factory :vova, parent: :user do
    first_name { "Владимир" }
    last_name { "Шмаков" }
    email { "test4@te.st" }
    password { "password" }  
    hired_date { "2020.07.17" }
  end

  factory :nastya, parent: :user do
    first_name { "Анастасия" }
    last_name { "Петрова" }
    email { "test5@te.st" }
    password { "password" }  
    hired_date { "2021.03.26" }
  end
end
