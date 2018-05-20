    /*
    *
    *       Project :  
    *               Farming Party
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           Cfg_Items.hpp
    *
    *       DESCRIPTION :
    *               items virtuel
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

    class DA3F_Cfg_Items
    {

        class Med_item_bandage
        {
            displayname = "Bandage";
            Poids       = 0.5;
            prix_achat  = 75;
            prix_vente  = 25;
            icon        = ""; // picture this item
            model       = ""; // model 3D for this item
        };
            class Med_item_Epi
            {
                displayname = "Epinéphrine";
                Poids       = 0.5;
                prix_achat  = 150;
                prix_vente  = 75;
                icon        = ""; // picture this item
                model       = ""; // model 3D for this item
            };

            class Med_item_Morphine
            {
                displayname = "Morphine";
                Poids       = 0.5;
                prix_achat  = 150;
                prix_vente  = 75;
                icon        = ""; // picture this item
                model       = ""; // model 3D for this item
            };

            class Med_item_sang100ml
            {
                displayname = $STR_DA3F_Item_Sang;
                Poids       = 0.5;
                prix_achat  = 150;
                prix_vente  = 75;
                icon        = ""; // picture this item
                model       = ""; // model 3D for this item
            };


        class Gen_item_Ration
        {
            displayname = $STR_DA3F_Item_Ration;
            Poids       = 1;
            prix_achat  = 50;
            prix_vente  = 15;
            icon        = ""; // picture this item
            model       = ""; // model 3D for this item
        };

            class Gen_item_Wather
            {
                displayname = $STR_DA3F_Item_Wather;
                Poids       = 3;
                prix_achat  = 10;
                prix_vente  = 3;
                icon        = ""; // picture this item
                model       = ""; // model 3D for this item
            };
            
    };