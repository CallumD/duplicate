class ImagesController < ApplicationController
  def serve
    path = "/tmp/#{params[:filename]}.#{params[:format]}"

    send_file(path, {
      :disposition => 'inline',
      :type        => 'image/jpeg',
      :x_sendfile  => true
    })
  end
end
