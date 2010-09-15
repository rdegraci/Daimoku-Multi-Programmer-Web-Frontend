authorization do
  role :admin do
    has_permission_on [:users ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:user_sessions ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    
    has_permission_on [:simcharacters ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simdoors ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simdowns ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simeasts ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simkeys ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simmaps ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simnorths ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simpeople ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simplaces ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simsouths ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simthings ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simups ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:simwests ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    
    has_permission_on [:sim_modules ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:sim_klasses ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:sim_variables ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:sim_scripts ], :to =>[:index, :show, :new, :create, :edit, :update, :destroy]
    
  end

  role :user do
    includes :guest
    
    has_permission_on [:simcharacters ], :to => [:index, :show]
    has_permission_on [:simdoors ], :to => [:index, :show]
    has_permission_on [:simkeys ], :to => [:index, :show]
    has_permission_on [:simmaps ], :to => [:index, :show]
    has_permission_on [:simpeople ], :to => [:index, :show]
    has_permission_on [:simplaces ], :to => [:index, :show]
    has_permission_on [:simthings ], :to => [:index, :show]
    
    has_permission_on [:sim_modules ], :to => [:index, :show, :new, :create, :edit, :update]
    has_permission_on [:sim_klasses ], :to => [:index, :show, :new, :create, :edit, :update]
    has_permission_on [:sim_variables ], :to => [:index, :show, :new, :create, :edit, :update]
    has_permission_on [:sim_scripts ], :to => [:index, :show, :new, :create, :edit, :update]
    
  end
      
  role :guest do
    
    # login/logout
    has_permission_on [:user_sessions ], :to => [:new, :create, :destroy]
    
    # registration
    has_permission_on [:users ], :to => [:new, :create]
    
    has_permission_on [:users ], :to => [:show, :edit, :update, :destroy] do
      if_attribute :id => is { user.id}
    end
  end
  
end
