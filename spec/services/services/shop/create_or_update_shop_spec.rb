require 'rails_helper'

describe Services::Shop::CreateOrUpdateShop, type: :service do
  let :hash do
    json = '{"shop_id":19569591,"shop_name":"AmberFriends","user_id":205549899,"creation_tsz":1549920969,"title":"Natural baltic amber. Competitive price & good quality.","announcement":"New and vintage baltic amber jewelry.","currency_code":"USD","is_vacation":false,"vacation_message":null,"sale_message":null,"digital_sale_message":null,"last_updated_tsz":1609849899,"listing_active_count":160,"digital_listing_count":0,"login_name":"cb34szwe","accepts_custom_requests":false,"policy_welcome":null,"policy_payment":"SECURE OPTIONS\nEtsy keeps your payment information secure. Sellers don\'t receive your credit card information.\n- PayPal","policy_shipping":"PROCESSING TIME\nThe time I need to prepare an order for shipping varies. For details, see individual items.\n\nESTIMATED SHIPPING TIME\nNorth America: 1-4 weeks\nEurope: 1-3 weeks\nAustralia, New Zealand and Oceania: 3-5 weeks\nAsia Pacific: 3-5 weeks\nLatin America and the Caribbean: 3-5 weeks\n\nI\'ll do my best to meet these shipping estimates, but cannot guarantee them. Actual delivery time will depend on the shipping method you choose.\n\nCUSTOMS AND DUTIES FEES\nBuyers are responsible for any customs or duties fees that may apply. Sellers aren\'t responsible for delays due to customs","policy_refunds":"I GLADLY ACCEPT RETURNS AND EXCHANGES\nJust contact me within: 14 days of delivery\nShip returns back to me within: 30 days of delivery\n\nI DON\'T ACCEPT CANCELLATIONS\nBut please contact me if you have any problems with your order.\n\nTHE FOLLOWING ITEMS CAN\'T BE RETURNED\nBecause of the nature of these items, unless they arrive damaged or defective, I can\'t accept returns for:\n- Custom or personalized orders\n- Perishable products (like food or flowers)\n- Digital downloads\n- Intimate items (for health\/hygiene reasons)\n\nCONDITIONS OF RETURN\nBuyers are responsible for return shipping costs.\nIf the item is not returned in its original condition, the buyer is responsible for any loss in value.","policy_additional":"","policy_seller_info":"","policy_updated_tsz":null,"policy_has_private_receipt_info":false,"vacation_autoreply":null,"url":"https:\/\/www.etsy.com\/shop\/AmberFriends?utm_source=trendr&utm_medium=api&utm_campaign=api","image_url_760x100":null,"num_favorers":146,"languages":["en-US","fr","de","it","es"],"upcoming_local_event_id":null,"icon_url_fullxfull":"https:\/\/i.etsystatic.com\/isla\/572533\/34284694\/isla_fullxfull.34284694_iduhcxr1.jpg?version=0","is_using_structured_policies":true,"has_onboarded_structured_policies":true,"has_unstructured_policies":false,"include_dispute_form_link":false,"is_direct_checkout_onboarded":false,"policy_privacy":"","is_calculated_eligible":false,"is_opted_in_to_buyer_promise":true,"is_shop_us_based":false}'
   JSON.load(json)
  end

  context 'when shop does not already exist' do
    it 'creates the shop' do
      expect do
        described_class.new(hash).call
      end.to change { Shop.count }.by(1)
    end
  end

  context 'when shop already exists' do
    let!(:shop) { create(:shop, etsy_id: hash['shop_id']) }

    it 'does not create a new the shop' do
      expect do
        described_class.new(hash).call
      end.not_to change { Shop.count }
    end

    it 'updates and returns the shop' do
      expect do
        described_class.new(hash).call
      end.to change { shop.reload.name }
    end
  end
end
