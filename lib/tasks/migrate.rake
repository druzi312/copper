task migrate: :environment do
  Painting.where(cloudinary_asset_id: nil).find_each do |p|
    puts p.painting_path.inspect
    if p.painting_path.to_s.strip.present?
      resp = Cloudinary::Uploader.upload(Rails.root.join("app/assets/images/art/#{p.painting_path}"))
      p.update(cloudinary_asset_id: resp["public_id"])
    end
  end
end