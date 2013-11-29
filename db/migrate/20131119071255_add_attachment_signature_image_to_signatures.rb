class AddAttachmentSignatureImageToSignatures < ActiveRecord::Migration
  def self.up
    change_table :signatures do |t|
      t.attachment :signature_image
    end
  end

  def self.down
    drop_attached_file :signatures, :signature_image
  end
end
