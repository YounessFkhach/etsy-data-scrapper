require 'rails_helper'

describe Services::Listing::CreateOrUpdateImages, type: :service do
  let!(:listing) { create(:listing) }
  let :array do
   json = '[
     {
       "listing_image_id": 1884081600,
       "hex_code": "747473",
       "red": 116,
       "green": 116,
       "blue": 115,
       "hue": 60,
       "saturation": 0,
       "brightness": 45,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 1,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/6290b5/1884081600/il_75x75.1884081600_tg5r.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/6290b5/1884081600/il_170x135.1884081600_tg5r.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/6290b5/1884081600/il_570xN.1884081600_tg5r.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/6290b5/1884081600/il_fullxfull.1884081600_tg5r.jpg",
       "full_height": 2748,
       "full_width": 2748
     },
     {
       "listing_image_id": 1884080512,
       "hex_code": "7E7C72",
       "red": 126,
       "green": 124,
       "blue": 114,
       "hue": 50,
       "saturation": 9,
       "brightness": 49,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 2,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/39f3cf/1884080512/il_75x75.1884080512_75xx.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/39f3cf/1884080512/il_170x135.1884080512_75xx.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/39f3cf/1884080512/il_570xN.1884080512_75xx.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/39f3cf/1884080512/il_fullxfull.1884080512_75xx.jpg",
       "full_height": 2472,
       "full_width": 2472
     },
     {
       "listing_image_id": 1884080816,
       "hex_code": "737370",
       "red": 115,
       "green": 115,
       "blue": 112,
       "hue": 60,
       "saturation": 2,
       "brightness": 45,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 3,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/5f6bb7/1884080816/il_75x75.1884080816_74yk.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/5f6bb7/1884080816/il_170x135.1884080816_74yk.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/5f6bb7/1884080816/il_570xN.1884080816_74yk.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/5f6bb7/1884080816/il_fullxfull.1884080816_74yk.jpg",
       "full_height": 2604,
       "full_width": 2604
     },
     {
       "listing_image_id": 1931605345,
       "hex_code": "888678",
       "red": 136,
       "green": 134,
       "blue": 120,
       "hue": 52,
       "saturation": 11,
       "brightness": 53,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 4,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/dc42ca/1931605345/il_75x75.1931605345_jvdc.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/dc42ca/1931605345/il_170x135.1931605345_jvdc.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/dc42ca/1931605345/il_570xN.1931605345_jvdc.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/dc42ca/1931605345/il_fullxfull.1931605345_jvdc.jpg",
       "full_height": 2496,
       "full_width": 2496
     },
     {
       "listing_image_id": 1931606167,
       "hex_code": "747568",
       "red": 116,
       "green": 117,
       "blue": 104,
       "hue": 65,
       "saturation": 11,
       "brightness": 45,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 5,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/3d39b8/1931606167/il_75x75.1931606167_ei61.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/3d39b8/1931606167/il_170x135.1931606167_ei61.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/3d39b8/1931606167/il_570xN.1931606167_ei61.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/3d39b8/1931606167/il_fullxfull.1931606167_ei61.jpg",
       "full_height": 2532,
       "full_width": 2532
     },
     {
       "listing_image_id": 1931606483,
       "hex_code": "838371",
       "red": 131,
       "green": 131,
       "blue": 113,
       "hue": 60,
       "saturation": 13,
       "brightness": 51,
       "is_black_and_white": false,
       "creation_tsz": 1558394340,
       "listing_id": 707848199,
       "rank": 6,
       "url_75x75": "https://i.etsystatic.com/19569591/d/il/d53643/1931606483/il_75x75.1931606483_qvtu.jpg?version=0",
       "url_170x135": "https://i.etsystatic.com/19569591/d/il/d53643/1931606483/il_170x135.1931606483_qvtu.jpg?version=0",
       "url_570xN": "https://i.etsystatic.com/19569591/r/il/d53643/1931606483/il_570xN.1931606483_qvtu.jpg",
       "url_fullxfull": "https://i.etsystatic.com/19569591/r/il/d53643/1931606483/il_fullxfull.1931606483_qvtu.jpg",
       "full_height": 2100,
       "full_width": 2100
     }
    ]'
    JSON.load(json)
  end

  context 'when the array is not empty' do
    it 'creates the images' do
      expect do
        described_class.new(array, listing.id).call
      end.to change { Image.count }.by(array.size)
    end
  end
end
