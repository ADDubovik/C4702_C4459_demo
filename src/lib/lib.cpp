#include "lib.h"

#include <boost/asio.hpp>
#include <boost/beast/websocket.hpp>
#include <boost/asio/ssl.hpp>


namespace {
  using Context = boost::asio::ssl::context;
  using Io_service = boost::asio::io_service;
  using Socket = boost::asio::ip::tcp::socket;
  using Stream = boost::asio::ssl::stream<Socket&>;

  static Io_service ioservice;
  static Context context(Context::sslv23);

  void bar()
  {
    auto req = boost::beast::http::request<boost::beast::http::string_body>();

    auto socket = Socket(ioservice);
    auto stream = Stream(socket, context);

    boost::beast::http::async_write
    (
      stream,
      req,
      [](auto, auto) {}
    );
  }
} // namespace


void foo()
{
}
