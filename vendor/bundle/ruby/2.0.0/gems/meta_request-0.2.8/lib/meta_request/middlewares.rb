module MetaRequest
  module Middlewares
    autoload :Headers,            "meta_request/middlewares/headers"
    autoload :AppRequestHandler,  "meta_request/middlewares/app_request_handler"
    autoload :MetaRequestHandler, "meta_request/middlewares/meta_request_handler"
    autoload :RequestId,          "meta_request/middlewares/request_id"
  end
end
