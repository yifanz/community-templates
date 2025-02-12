/*
 Copyright 2024 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

{ pkgs, ... }: {
  packages = [
    pkgs.python3
    pkgs.unzip
    pkgs.curl
  ];
  bootstrap = ''
    mkdir -p "$out/.idx/"
    cp -rf ${./dev.nix} "$out/.idx/dev.nix"

    python3 -m venv .venv
    source .venv/bin/activate
    pip install reflex
    
    cd $out

    reflex init --name app --template blank
    cp -f ${./devserver.sh} "devserver.sh"
    chmod +x "devserver.sh"

    cd ..

    chmod -R +w "$out"
  '';
}