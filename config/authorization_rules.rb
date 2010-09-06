authorization do
  role :admin do
    has_permission_on [:users ], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
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
    
  end
  
  role :guest do
    has_permission_on [:users ], :to => [:site_home] 
    has_permission_on [:users ], :to => [:show, :edit, :update, :destroy] do
      if_attribute :id => is { user.id}
    end
    has_permission_on [:simcharacters ], :to => [:index, :show]
    has_permission_on [:simdoors ], :to => [:index, :show]
    has_permission_on [:simkeys ], :to => [:index, :show]
    has_permission_on [:simmaps ], :to => [:index, :show]
    has_permission_on [:simpeople ], :to => [:index, :show]
    has_permission_on [:simplaces ], :to => [:index, :show]
    has_permission_on [:simthings ], :to => [:index, :show]
  end
  
end
