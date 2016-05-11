require 'formula'

HOMEBREW_NGINX_BUILD_VERSION='0.9.3'
class NginxBuild < Formula
  homepage 'https://github.com/cubicdaiya/nginx-build'
  url 'https://github.com/cubicdaiya/nginx-build.git', :tag => "v#{HOMEBREW_NGINX_BUILD_VERSION}"
  version HOMEBREW_NGINX_BUILD_VERSION
  head 'https://github.com/cubicdaiya/nginx-build.git', :branch => 'master'

  depends_on 'go' => :build
  depends_on 'hg' => :build

  def install
    ENV['GOPATH'] = buildpath
    mkdir_p buildpath/'src/github.com/cubicdaiya'
    ln_s buildpath, buildpath/'src/github.com/cubicdaiya/nginx-build'
    system 'go', 'get', 'github.com/go-ini/ini'
    system 'go', 'build', '-o', 'nginx-build'
    bin.install 'nginx-build'
  end
end
