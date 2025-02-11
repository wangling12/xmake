--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015-2020, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        xmake.lua
--

-- define toolchain
toolchain("emcc")

    -- set homepage
    set_homepage("http://emscripten.org")
    set_description("A toolchain for compiling to asm.js and WebAssembly")

    -- mark as standalone toolchain
    set_kind("standalone")
        
    -- set toolset
    set_toolset("cc", "emcc")
    set_toolset("cxx", "emcc", "em++")
    set_toolset("ld", "em++", "emcc")
    set_toolset("sh", "em++", "emcc")
    set_toolset("ar", "emar")
    set_toolset("ex", "emar")
    set_toolset("as", "emcc")

    -- check toolchain
    on_check(function (toolchain)
        return import("lib.detect.find_tool")("emcc")
    end)

    -- on load
    on_load(function (toolchain)
        toolchain:add("cxflags", "")
        toolchain:add("asflags", "")
        toolchain:add("ldflags", "")
        toolchain:add("shflags", "")
    end)
