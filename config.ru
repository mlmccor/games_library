require_relative './config/environment'



if ActiveRecord::Migrator.needs_migration?
  raise "Migrations are pending. Run 'rake db:migrate' to continue"
end

use Rack::MethodOverride
run ApplicationController
use UsersController
use GamesController
use UserGamesController
