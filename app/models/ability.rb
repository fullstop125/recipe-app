class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    else
      can %i[update destroy], Recipe, user_id: user.id
      can %i[destroy], Food, user_id: user.id
      can :create, Food
      can :create, Recipe
      can :create, RecipeFood
      can :destroy, RecipeFood
      can :read, Recipe
      can :read, :all
    end
  end
end
