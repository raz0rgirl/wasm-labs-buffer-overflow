(module
  (type (;0;) (func (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32) (result i64)))
  (import "env" "emscripten_resize_heap" (func (;0;) (type 2)))
  (func (;1;) (type 3)
    call 9)
  (func (;2;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set 0
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    i32.load offset=12
    local.set 4
    i32.const 65540
    local.set 5
    local.get 5
    local.get 4
    call 6
    drop
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set 0
    return)
  (func (;3;) (type 0) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 0
    local.get 0
    i32.load offset=65556
    local.set 1
    local.get 1
    return)
  (func (;4;) (type 3)
    (local i64 i32)
    i64.const 0
    local.set 0
    i32.const 0
    local.set 1
    local.get 1
    local.get 0
    i64.store offset=65548 align=4
    local.get 1
    local.get 0
    i64.store offset=65540 align=4
    local.get 1
    local.get 1
    i32.store offset=65556
    return)
  (func (;5;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 0
          i32.xor
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load8_u
          local.set 2
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 1
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            local.get 1
            i32.load8_u
            local.tee 2
            i32.store8
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 3
            i32.and
            br_if 0 (;@4;)
          end
        end
        i32.const 16843008
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.get 2
        i32.or
        i32.const -2139062144
        i32.and
        i32.const -2139062144
        i32.ne
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 0
          local.get 2
          i32.store
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.load offset=4
          local.set 2
          local.get 1
          i32.const 4
          i32.add
          local.tee 3
          local.set 1
          local.get 2
          i32.const 16843008
          local.get 2
          i32.sub
          i32.or
          i32.const -2139062144
          i32.and
          i32.const -2139062144
          i32.eq
          br_if 0 (;@3;)
        end
        local.get 3
        local.set 1
      end
      local.get 0
      local.get 2
      i32.store8
      local.get 2
      i32.const 255
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_u offset=1
        local.tee 2
        i32.store8 offset=1
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;6;) (type 4) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call 5
    drop
    local.get 0)
  (func (;7;) (type 1) (param i32)
    local.get 0
    global.set 1)
  (func (;8;) (type 0) (result i32)
    global.get 1)
  (func (;9;) (type 3)
    i32.const 65536
    global.set 3
    i32.const 0
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    global.set 2)
  (func (;10;) (type 0) (result i32)
    global.get 0
    global.get 2
    i32.sub)
  (func (;11;) (type 0) (result i32)
    global.get 3)
  (func (;12;) (type 0) (result i32)
    global.get 2)
  (func (;13;) (type 0) (result i32)
    memory.size
    i32.const 16
    i32.shl)
  (func (;14;) (type 0) (result i32)
    i32.const 65560)
  (func (;15;) (type 2) (param i32) (result i32)
    (local i32 i32)
    i32.const 0
    i32.load offset=65536
    local.tee 1
    local.get 0
    i32.const 7
    i32.add
    i32.const -8
    i32.and
    local.tee 2
    i32.add
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.le_u
          br_if 1 (;@2;)
        end
        local.get 0
        call 13
        i32.le_u
        br_if 1 (;@1;)
        local.get 0
        call 0
        br_if 1 (;@1;)
      end
      call 14
      i32.const 48
      i32.store
      i32.const -1
      return
    end
    i32.const 0
    local.get 0
    i32.store offset=65536
    local.get 1)
  (func (;16;) (type 2) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.const 244
                          i32.gt_u
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=65564
                            local.tee 2
                            i32.const 16
                            local.get 0
                            i32.const 11
                            i32.add
                            i32.const 504
                            i32.and
                            local.get 0
                            i32.const 11
                            i32.lt_u
                            select
                            local.tee 3
                            i32.const 3
                            i32.shr_u
                            local.tee 4
                            i32.shr_u
                            local.tee 0
                            i32.const 3
                            i32.and
                            i32.eqz
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.const -1
                                i32.xor
                                i32.const 1
                                i32.and
                                local.get 4
                                i32.add
                                local.tee 3
                                i32.const 3
                                i32.shl
                                local.tee 4
                                i32.const 65604
                                i32.add
                                local.tee 0
                                local.get 4
                                i32.const 65612
                                i32.add
                                i32.load
                                local.tee 4
                                i32.load offset=8
                                local.tee 5
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 2
                                i32.const -2
                                local.get 3
                                i32.rotl
                                i32.and
                                i32.store offset=65564
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 0
                              i32.store offset=12
                              local.get 0
                              local.get 5
                              i32.store offset=8
                            end
                            local.get 4
                            i32.const 8
                            i32.add
                            local.set 0
                            local.get 4
                            local.get 3
                            i32.const 3
                            i32.shl
                            local.tee 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 4
                            local.get 3
                            i32.add
                            local.tee 4
                            local.get 4
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            br 11 (;@1;)
                          end
                          local.get 3
                          i32.const 0
                          i32.load offset=65572
                          local.tee 6
                          i32.le_u
                          br_if 1 (;@10;)
                          block  ;; label = @12
                            local.get 0
                            i32.eqz
                            br_if 0 (;@12;)
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                local.get 4
                                i32.shl
                                i32.const 2
                                local.get 4
                                i32.shl
                                local.tee 0
                                i32.const 0
                                local.get 0
                                i32.sub
                                i32.or
                                i32.and
                                i32.ctz
                                local.tee 4
                                i32.const 3
                                i32.shl
                                local.tee 0
                                i32.const 65604
                                i32.add
                                local.tee 5
                                local.get 0
                                i32.const 65612
                                i32.add
                                i32.load
                                local.tee 0
                                i32.load offset=8
                                local.tee 7
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 0
                                local.get 2
                                i32.const -2
                                local.get 4
                                i32.rotl
                                i32.and
                                local.tee 2
                                i32.store offset=65564
                                br 1 (;@13;)
                              end
                              local.get 7
                              local.get 5
                              i32.store offset=12
                              local.get 5
                              local.get 7
                              i32.store offset=8
                            end
                            local.get 0
                            local.get 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 3
                            i32.add
                            local.tee 7
                            local.get 4
                            i32.const 3
                            i32.shl
                            local.tee 4
                            local.get 3
                            i32.sub
                            local.tee 3
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 4
                            i32.add
                            local.get 3
                            i32.store
                            block  ;; label = @13
                              local.get 6
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const -8
                              i32.and
                              i32.const 65604
                              i32.add
                              local.set 5
                              i32.const 0
                              i32.load offset=65584
                              local.set 4
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 2
                                  i32.const 1
                                  local.get 6
                                  i32.const 3
                                  i32.shr_u
                                  i32.shl
                                  local.tee 8
                                  i32.and
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.get 2
                                  local.get 8
                                  i32.or
                                  i32.store offset=65564
                                  local.get 5
                                  local.set 8
                                  br 1 (;@14;)
                                end
                                local.get 5
                                i32.load offset=8
                                local.set 8
                              end
                              local.get 5
                              local.get 4
                              i32.store offset=8
                              local.get 8
                              local.get 4
                              i32.store offset=12
                              local.get 4
                              local.get 5
                              i32.store offset=12
                              local.get 4
                              local.get 8
                              i32.store offset=8
                            end
                            local.get 0
                            i32.const 8
                            i32.add
                            local.set 0
                            i32.const 0
                            local.get 7
                            i32.store offset=65584
                            i32.const 0
                            local.get 3
                            i32.store offset=65572
                            br 11 (;@1;)
                          end
                          i32.const 0
                          i32.load offset=65568
                          local.tee 9
                          i32.eqz
                          br_if 1 (;@10;)
                          local.get 9
                          i32.ctz
                          i32.const 2
                          i32.shl
                          i32.const 65868
                          i32.add
                          i32.load
                          local.tee 7
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 3
                          i32.sub
                          local.set 4
                          local.get 7
                          local.set 5
                          block  ;; label = @12
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 5
                                i32.load offset=16
                                local.tee 0
                                br_if 0 (;@14;)
                                local.get 5
                                i32.load offset=20
                                local.tee 0
                                i32.eqz
                                br_if 2 (;@12;)
                              end
                              local.get 0
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 3
                              i32.sub
                              local.tee 5
                              local.get 4
                              local.get 5
                              local.get 4
                              i32.lt_u
                              local.tee 5
                              select
                              local.set 4
                              local.get 0
                              local.get 7
                              local.get 5
                              select
                              local.set 7
                              local.get 0
                              local.set 5
                              br 0 (;@13;)
                            end
                            unreachable
                          end
                          local.get 7
                          i32.load offset=24
                          local.set 10
                          block  ;; label = @12
                            local.get 7
                            i32.load offset=12
                            local.tee 0
                            local.get 7
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=8
                            local.tee 5
                            local.get 0
                            i32.store offset=12
                            local.get 0
                            local.get 5
                            i32.store offset=8
                            br 10 (;@2;)
                          end
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 7
                              i32.load offset=20
                              local.tee 5
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const 20
                              i32.add
                              local.set 8
                              br 1 (;@12;)
                            end
                            local.get 7
                            i32.load offset=16
                            local.tee 5
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 7
                            i32.const 16
                            i32.add
                            local.set 8
                          end
                          loop  ;; label = @12
                            local.get 8
                            local.set 11
                            local.get 5
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.set 8
                            local.get 0
                            i32.load offset=20
                            local.tee 5
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 16
                            i32.add
                            local.set 8
                            local.get 0
                            i32.load offset=16
                            local.tee 5
                            br_if 0 (;@12;)
                          end
                          local.get 11
                          i32.const 0
                          i32.store
                          br 9 (;@2;)
                        end
                        i32.const -1
                        local.set 3
                        local.get 0
                        i32.const -65
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 11
                        i32.add
                        local.tee 4
                        i32.const -8
                        i32.and
                        local.set 3
                        i32.const 0
                        i32.load offset=65568
                        local.tee 10
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 31
                        local.set 6
                        block  ;; label = @11
                          local.get 0
                          i32.const 16777204
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const 38
                          local.get 4
                          i32.const 8
                          i32.shr_u
                          i32.clz
                          local.tee 0
                          i32.sub
                          i32.shr_u
                          i32.const 1
                          i32.and
                          local.get 0
                          i32.const 1
                          i32.shl
                          i32.sub
                          i32.const 62
                          i32.add
                          local.set 6
                        end
                        i32.const 0
                        local.get 3
                        i32.sub
                        local.set 4
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                local.get 6
                                i32.const 2
                                i32.shl
                                i32.const 65868
                                i32.add
                                i32.load
                                local.tee 5
                                br_if 0 (;@14;)
                                i32.const 0
                                local.set 0
                                i32.const 0
                                local.set 8
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 0
                              local.get 3
                              i32.const 0
                              i32.const 25
                              local.get 6
                              i32.const 1
                              i32.shr_u
                              i32.sub
                              local.get 6
                              i32.const 31
                              i32.eq
                              select
                              i32.shl
                              local.set 7
                              i32.const 0
                              local.set 8
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 5
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 3
                                  i32.sub
                                  local.tee 2
                                  local.get 4
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                  local.get 2
                                  local.set 4
                                  local.get 5
                                  local.set 8
                                  local.get 2
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 4
                                  local.get 5
                                  local.set 8
                                  local.get 5
                                  local.set 0
                                  br 3 (;@12;)
                                end
                                local.get 0
                                local.get 5
                                i32.load offset=20
                                local.tee 2
                                local.get 2
                                local.get 5
                                local.get 7
                                i32.const 29
                                i32.shr_u
                                i32.const 4
                                i32.and
                                i32.add
                                i32.const 16
                                i32.add
                                i32.load
                                local.tee 11
                                i32.eq
                                select
                                local.get 0
                                local.get 2
                                select
                                local.set 0
                                local.get 7
                                i32.const 1
                                i32.shl
                                local.set 7
                                local.get 11
                                local.set 5
                                local.get 11
                                br_if 0 (;@14;)
                              end
                            end
                            block  ;; label = @13
                              local.get 0
                              local.get 8
                              i32.or
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 8
                              i32.const 2
                              local.get 6
                              i32.shl
                              local.tee 0
                              i32.const 0
                              local.get 0
                              i32.sub
                              i32.or
                              local.get 10
                              i32.and
                              local.tee 0
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 0
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 65868
                              i32.add
                              i32.load
                              local.set 0
                            end
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          loop  ;; label = @12
                            local.get 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 3
                            i32.sub
                            local.tee 2
                            local.get 4
                            i32.lt_u
                            local.set 7
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=16
                              local.tee 5
                              br_if 0 (;@13;)
                              local.get 0
                              i32.load offset=20
                              local.set 5
                            end
                            local.get 2
                            local.get 4
                            local.get 7
                            select
                            local.set 4
                            local.get 0
                            local.get 8
                            local.get 7
                            select
                            local.set 8
                            local.get 5
                            local.set 0
                            local.get 5
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 8
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 0
                        i32.load offset=65572
                        local.get 3
                        i32.sub
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 8
                        i32.load offset=24
                        local.set 11
                        block  ;; label = @11
                          local.get 8
                          i32.load offset=12
                          local.tee 0
                          local.get 8
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 8
                          i32.load offset=8
                          local.tee 5
                          local.get 0
                          i32.store offset=12
                          local.get 0
                          local.get 5
                          i32.store offset=8
                          br 8 (;@3;)
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=20
                            local.tee 5
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 8
                            i32.const 20
                            i32.add
                            local.set 7
                            br 1 (;@11;)
                          end
                          local.get 8
                          i32.load offset=16
                          local.tee 5
                          i32.eqz
                          br_if 3 (;@8;)
                          local.get 8
                          i32.const 16
                          i32.add
                          local.set 7
                        end
                        loop  ;; label = @11
                          local.get 7
                          local.set 2
                          local.get 5
                          local.tee 0
                          i32.const 20
                          i32.add
                          local.set 7
                          local.get 0
                          i32.load offset=20
                          local.tee 5
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 16
                          i32.add
                          local.set 7
                          local.get 0
                          i32.load offset=16
                          local.tee 5
                          br_if 0 (;@11;)
                        end
                        local.get 2
                        i32.const 0
                        i32.store
                        br 7 (;@3;)
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=65572
                        local.tee 0
                        local.get 3
                        i32.lt_u
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.load offset=65584
                        local.set 4
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            local.get 3
                            i32.sub
                            local.tee 5
                            i32.const 16
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 3
                            i32.add
                            local.tee 7
                            local.get 5
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 4
                            local.get 0
                            i32.add
                            local.get 5
                            i32.store
                            local.get 4
                            local.get 3
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            br 1 (;@11;)
                          end
                          local.get 4
                          local.get 0
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 4
                          local.get 0
                          i32.add
                          local.tee 0
                          local.get 0
                          i32.load offset=4
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.set 7
                          i32.const 0
                          local.set 5
                        end
                        i32.const 0
                        local.get 5
                        i32.store offset=65572
                        i32.const 0
                        local.get 7
                        i32.store offset=65584
                        local.get 4
                        i32.const 8
                        i32.add
                        local.set 0
                        br 9 (;@1;)
                      end
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=65576
                        local.tee 7
                        local.get 3
                        i32.le_u
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 7
                        local.get 3
                        i32.sub
                        local.tee 4
                        i32.store offset=65576
                        i32.const 0
                        i32.const 0
                        i32.load offset=65588
                        local.tee 0
                        local.get 3
                        i32.add
                        local.tee 5
                        i32.store offset=65588
                        local.get 5
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 3
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 0
                        i32.const 8
                        i32.add
                        local.set 0
                        br 9 (;@1;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=66036
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.load offset=66044
                          local.set 4
                          br 1 (;@10;)
                        end
                        i32.const 0
                        i64.const -1
                        i64.store offset=66048 align=4
                        i32.const 0
                        i64.const 17592186048512
                        i64.store offset=66040 align=4
                        i32.const 0
                        local.get 1
                        i32.const 12
                        i32.add
                        i32.const -16
                        i32.and
                        i32.const 1431655768
                        i32.xor
                        i32.store offset=66036
                        i32.const 0
                        i32.const 0
                        i32.store offset=66056
                        i32.const 0
                        i32.const 0
                        i32.store offset=66008
                        i32.const 4096
                        local.set 4
                      end
                      i32.const 0
                      local.set 0
                      local.get 4
                      local.get 3
                      i32.const 47
                      i32.add
                      local.tee 6
                      i32.add
                      local.tee 2
                      i32.const 0
                      local.get 4
                      i32.sub
                      local.tee 11
                      i32.and
                      local.tee 8
                      local.get 3
                      i32.le_u
                      br_if 8 (;@1;)
                      i32.const 0
                      local.set 0
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=66004
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.load offset=65996
                        local.tee 5
                        local.get 8
                        i32.add
                        local.tee 10
                        local.get 5
                        i32.le_u
                        br_if 9 (;@1;)
                        local.get 10
                        local.get 4
                        i32.gt_u
                        br_if 9 (;@1;)
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load8_u offset=66008
                          i32.const 4
                          i32.and
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    i32.const 0
                                    i32.load offset=65588
                                    local.tee 4
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 66012
                                    local.set 0
                                    loop  ;; label = @17
                                      block  ;; label = @18
                                        local.get 0
                                        i32.load
                                        local.tee 5
                                        local.get 4
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        local.get 5
                                        local.get 0
                                        i32.load offset=4
                                        i32.add
                                        local.get 4
                                        i32.gt_u
                                        br_if 3 (;@15;)
                                      end
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 0
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  i32.const 0
                                  call 15
                                  local.tee 7
                                  i32.const -1
                                  i32.eq
                                  br_if 3 (;@12;)
                                  local.get 8
                                  local.set 2
                                  block  ;; label = @16
                                    i32.const 0
                                    i32.load offset=66040
                                    local.tee 0
                                    i32.const -1
                                    i32.add
                                    local.tee 4
                                    local.get 7
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 8
                                    local.get 7
                                    i32.sub
                                    local.get 4
                                    local.get 7
                                    i32.add
                                    i32.const 0
                                    local.get 0
                                    i32.sub
                                    i32.and
                                    i32.add
                                    local.set 2
                                  end
                                  local.get 2
                                  local.get 3
                                  i32.le_u
                                  br_if 3 (;@12;)
                                  block  ;; label = @16
                                    i32.const 0
                                    i32.load offset=66004
                                    local.tee 0
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    i32.load offset=65996
                                    local.tee 4
                                    local.get 2
                                    i32.add
                                    local.tee 5
                                    local.get 4
                                    i32.le_u
                                    br_if 4 (;@12;)
                                    local.get 5
                                    local.get 0
                                    i32.gt_u
                                    br_if 4 (;@12;)
                                  end
                                  local.get 2
                                  call 15
                                  local.tee 0
                                  local.get 7
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 5 (;@10;)
                                end
                                local.get 2
                                local.get 7
                                i32.sub
                                local.get 11
                                i32.and
                                local.tee 2
                                call 15
                                local.tee 7
                                local.get 0
                                i32.load
                                local.get 0
                                i32.load offset=4
                                i32.add
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 7
                                local.set 0
                              end
                              local.get 0
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              block  ;; label = @14
                                local.get 2
                                local.get 3
                                i32.const 48
                                i32.add
                                i32.lt_u
                                br_if 0 (;@14;)
                                local.get 0
                                local.set 7
                                br 4 (;@10;)
                              end
                              local.get 6
                              local.get 2
                              i32.sub
                              i32.const 0
                              i32.load offset=66044
                              local.tee 4
                              i32.add
                              i32.const 0
                              local.get 4
                              i32.sub
                              i32.and
                              local.tee 4
                              call 15
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 4
                              local.get 2
                              i32.add
                              local.set 2
                              local.get 0
                              local.set 7
                              br 3 (;@10;)
                            end
                            local.get 7
                            i32.const -1
                            i32.ne
                            br_if 2 (;@10;)
                          end
                          i32.const 0
                          i32.const 0
                          i32.load offset=66008
                          i32.const 4
                          i32.or
                          i32.store offset=66008
                        end
                        local.get 8
                        call 15
                        local.set 7
                        i32.const 0
                        call 15
                        local.set 0
                        local.get 7
                        i32.const -1
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 0
                        i32.const -1
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 7
                        local.get 0
                        i32.ge_u
                        br_if 5 (;@5;)
                        local.get 0
                        local.get 7
                        i32.sub
                        local.tee 2
                        local.get 3
                        i32.const 40
                        i32.add
                        i32.le_u
                        br_if 5 (;@5;)
                      end
                      i32.const 0
                      i32.const 0
                      i32.load offset=65996
                      local.get 2
                      i32.add
                      local.tee 0
                      i32.store offset=65996
                      block  ;; label = @10
                        local.get 0
                        i32.const 0
                        i32.load offset=66000
                        i32.le_u
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 0
                        i32.store offset=66000
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=65588
                          local.tee 4
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 66012
                          local.set 0
                          loop  ;; label = @12
                            local.get 7
                            local.get 0
                            i32.load
                            local.tee 5
                            local.get 0
                            i32.load offset=4
                            local.tee 8
                            i32.add
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 5 (;@7;)
                          end
                          unreachable
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=65580
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 7
                            local.get 0
                            i32.ge_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.get 7
                          i32.store offset=65580
                        end
                        i32.const 0
                        local.set 0
                        i32.const 0
                        local.get 2
                        i32.store offset=66016
                        i32.const 0
                        local.get 7
                        i32.store offset=66012
                        i32.const 0
                        i32.const -1
                        i32.store offset=65596
                        i32.const 0
                        i32.const 0
                        i32.load offset=66036
                        i32.store offset=65600
                        i32.const 0
                        i32.const 0
                        i32.store offset=66024
                        loop  ;; label = @11
                          local.get 0
                          i32.const 3
                          i32.shl
                          local.tee 4
                          i32.const 65612
                          i32.add
                          local.get 4
                          i32.const 65604
                          i32.add
                          local.tee 5
                          i32.store
                          local.get 4
                          i32.const 65616
                          i32.add
                          local.get 5
                          i32.store
                          local.get 0
                          i32.const 1
                          i32.add
                          local.tee 0
                          i32.const 32
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        i32.const 0
                        local.get 2
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.const -8
                        local.get 7
                        i32.sub
                        i32.const 7
                        i32.and
                        local.tee 4
                        i32.sub
                        local.tee 5
                        i32.store offset=65576
                        i32.const 0
                        local.get 7
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store offset=65588
                        local.get 4
                        local.get 5
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 0
                        i32.load offset=66052
                        i32.store offset=65592
                        br 4 (;@6;)
                      end
                      local.get 4
                      local.get 7
                      i32.ge_u
                      br_if 2 (;@7;)
                      local.get 4
                      local.get 5
                      i32.lt_u
                      br_if 2 (;@7;)
                      local.get 0
                      i32.load offset=12
                      i32.const 8
                      i32.and
                      br_if 2 (;@7;)
                      local.get 0
                      local.get 8
                      local.get 2
                      i32.add
                      i32.store offset=4
                      i32.const 0
                      local.get 4
                      i32.const -8
                      local.get 4
                      i32.sub
                      i32.const 7
                      i32.and
                      local.tee 0
                      i32.add
                      local.tee 5
                      i32.store offset=65588
                      i32.const 0
                      i32.const 0
                      i32.load offset=65576
                      local.get 2
                      i32.add
                      local.tee 7
                      local.get 0
                      i32.sub
                      local.tee 0
                      i32.store offset=65576
                      local.get 5
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 4
                      local.get 7
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 0
                      i32.load offset=66052
                      i32.store offset=65592
                      br 3 (;@6;)
                    end
                    i32.const 0
                    local.set 0
                    br 6 (;@2;)
                  end
                  i32.const 0
                  local.set 0
                  br 4 (;@3;)
                end
                block  ;; label = @7
                  local.get 7
                  i32.const 0
                  i32.load offset=65580
                  i32.ge_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 7
                  i32.store offset=65580
                end
                local.get 7
                local.get 2
                i32.add
                local.set 5
                i32.const 66012
                local.set 0
                block  ;; label = @7
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 0
                      i32.load
                      local.tee 8
                      local.get 5
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 0 (;@9;)
                      br 2 (;@7;)
                    end
                    unreachable
                  end
                  local.get 0
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 3 (;@4;)
                end
                i32.const 66012
                local.set 0
                block  ;; label = @7
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load
                      local.tee 5
                      local.get 4
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 5
                      local.get 0
                      i32.load offset=4
                      i32.add
                      local.tee 5
                      local.get 4
                      i32.gt_u
                      br_if 2 (;@7;)
                    end
                    local.get 0
                    i32.load offset=8
                    local.set 0
                    br 0 (;@8;)
                  end
                  unreachable
                end
                i32.const 0
                local.get 2
                i32.const -40
                i32.add
                local.tee 0
                i32.const -8
                local.get 7
                i32.sub
                i32.const 7
                i32.and
                local.tee 8
                i32.sub
                local.tee 11
                i32.store offset=65576
                i32.const 0
                local.get 7
                local.get 8
                i32.add
                local.tee 8
                i32.store offset=65588
                local.get 8
                local.get 11
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 7
                local.get 0
                i32.add
                i32.const 40
                i32.store offset=4
                i32.const 0
                i32.const 0
                i32.load offset=66052
                i32.store offset=65592
                local.get 4
                local.get 5
                i32.const 39
                local.get 5
                i32.sub
                i32.const 7
                i32.and
                i32.add
                i32.const -47
                i32.add
                local.tee 0
                local.get 0
                local.get 4
                i32.const 16
                i32.add
                i32.lt_u
                select
                local.tee 8
                i32.const 27
                i32.store offset=4
                local.get 8
                i32.const 16
                i32.add
                i32.const 0
                i64.load offset=66020 align=4
                i64.store align=4
                local.get 8
                i32.const 0
                i64.load offset=66012 align=4
                i64.store offset=8 align=4
                i32.const 0
                local.get 8
                i32.const 8
                i32.add
                i32.store offset=66020
                i32.const 0
                local.get 2
                i32.store offset=66016
                i32.const 0
                local.get 7
                i32.store offset=66012
                i32.const 0
                i32.const 0
                i32.store offset=66024
                local.get 8
                i32.const 24
                i32.add
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.const 7
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 7
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 0
                  local.get 7
                  local.get 5
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 8
                local.get 4
                i32.eq
                br_if 0 (;@6;)
                local.get 8
                local.get 8
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 4
                local.get 8
                local.get 4
                i32.sub
                local.tee 7
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 8
                local.get 7
                i32.store
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 7
                    i32.const -8
                    i32.and
                    i32.const 65604
                    i32.add
                    local.set 0
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=65564
                        local.tee 5
                        i32.const 1
                        local.get 7
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 7
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 5
                        local.get 7
                        i32.or
                        i32.store offset=65564
                        local.get 0
                        local.set 5
                        br 1 (;@9;)
                      end
                      local.get 0
                      i32.load offset=8
                      local.set 5
                    end
                    local.get 0
                    local.get 4
                    i32.store offset=8
                    local.get 5
                    local.get 4
                    i32.store offset=12
                    i32.const 12
                    local.set 7
                    i32.const 8
                    local.set 8
                    br 1 (;@7;)
                  end
                  i32.const 31
                  local.set 0
                  block  ;; label = @8
                    local.get 7
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 7
                    i32.const 38
                    local.get 7
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 0
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 0
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 0
                  end
                  local.get 4
                  local.get 0
                  i32.store offset=28
                  local.get 4
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 0
                  i32.const 2
                  i32.shl
                  i32.const 65868
                  i32.add
                  local.set 5
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=65568
                        local.tee 8
                        i32.const 1
                        local.get 0
                        i32.shl
                        local.tee 2
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 8
                        local.get 2
                        i32.or
                        i32.store offset=65568
                        local.get 5
                        local.get 4
                        i32.store
                        local.get 4
                        local.get 5
                        i32.store offset=24
                        br 1 (;@9;)
                      end
                      local.get 7
                      i32.const 0
                      i32.const 25
                      local.get 0
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 0
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 0
                      local.get 5
                      i32.load
                      local.set 8
                      loop  ;; label = @10
                        local.get 8
                        local.tee 5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 7
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const 29
                        i32.shr_u
                        local.set 8
                        local.get 0
                        i32.const 1
                        i32.shl
                        local.set 0
                        local.get 5
                        local.get 8
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 2
                        i32.load
                        local.tee 8
                        br_if 0 (;@10;)
                      end
                      local.get 2
                      local.get 4
                      i32.store
                      local.get 4
                      local.get 5
                      i32.store offset=24
                    end
                    i32.const 8
                    local.set 7
                    i32.const 12
                    local.set 8
                    local.get 4
                    local.set 5
                    local.get 4
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 5
                  i32.load offset=8
                  local.tee 0
                  local.get 4
                  i32.store offset=12
                  local.get 5
                  local.get 4
                  i32.store offset=8
                  local.get 4
                  local.get 0
                  i32.store offset=8
                  i32.const 0
                  local.set 0
                  i32.const 24
                  local.set 7
                  i32.const 12
                  local.set 8
                end
                local.get 4
                local.get 8
                i32.add
                local.get 5
                i32.store
                local.get 4
                local.get 7
                i32.add
                local.get 0
                i32.store
              end
              i32.const 0
              i32.load offset=65576
              local.tee 0
              local.get 3
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 0
              local.get 3
              i32.sub
              local.tee 4
              i32.store offset=65576
              i32.const 0
              i32.const 0
              i32.load offset=65588
              local.tee 0
              local.get 3
              i32.add
              local.tee 5
              i32.store offset=65588
              local.get 5
              local.get 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              br 4 (;@1;)
            end
            call 14
            i32.const 48
            i32.store
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          local.get 7
          i32.store
          local.get 0
          local.get 0
          i32.load offset=4
          local.get 2
          i32.add
          i32.store offset=4
          local.get 7
          local.get 8
          local.get 3
          call 17
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 11
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              local.get 8
              i32.load offset=28
              local.tee 7
              i32.const 2
              i32.shl
              i32.const 65868
              i32.add
              local.tee 5
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 10
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              local.tee 10
              i32.store offset=65568
              br 2 (;@3;)
            end
            local.get 11
            i32.const 16
            i32.const 20
            local.get 11
            i32.load offset=16
            local.get 8
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 11
          i32.store offset=24
          block  ;; label = @4
            local.get 8
            i32.load offset=16
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 5
            i32.store offset=16
            local.get 5
            local.get 0
            i32.store offset=24
          end
          local.get 8
          i32.load offset=20
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 5
          i32.store offset=20
          local.get 5
          local.get 0
          i32.store offset=24
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 4
            local.get 3
            i32.add
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 8
            local.get 0
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 8
          local.get 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 3
          i32.add
          local.tee 7
          local.get 4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 7
          local.get 4
          i32.add
          local.get 4
          i32.store
          block  ;; label = @4
            local.get 4
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const -8
            i32.and
            i32.const 65604
            i32.add
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=65564
                local.tee 3
                i32.const 1
                local.get 4
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 4
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 3
                local.get 4
                i32.or
                i32.store offset=65564
                local.get 0
                local.set 4
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
              local.set 4
            end
            local.get 0
            local.get 7
            i32.store offset=8
            local.get 4
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 0
            i32.store offset=12
            local.get 7
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 0
          block  ;; label = @4
            local.get 4
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 38
            local.get 4
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 0
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 0
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 0
          end
          local.get 7
          local.get 0
          i32.store offset=28
          local.get 7
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 2
          i32.shl
          i32.const 65868
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 10
                i32.const 1
                local.get 0
                i32.shl
                local.tee 5
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 10
                local.get 5
                i32.or
                i32.store offset=65568
                local.get 3
                local.get 7
                i32.store
                local.get 7
                local.get 3
                i32.store offset=24
                br 1 (;@5;)
              end
              local.get 4
              i32.const 0
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 0
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 0
              local.get 3
              i32.load
              local.set 5
              loop  ;; label = @6
                local.get 5
                local.tee 3
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 4
                i32.eq
                br_if 2 (;@4;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 5
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 3
                local.get 5
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 2
                i32.load
                local.tee 5
                br_if 0 (;@6;)
              end
              local.get 2
              local.get 7
              i32.store
              local.get 7
              local.get 3
              i32.store offset=24
            end
            local.get 7
            local.get 7
            i32.store offset=12
            local.get 7
            local.get 7
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
          local.tee 0
          local.get 7
          i32.store offset=12
          local.get 3
          local.get 7
          i32.store offset=8
          local.get 7
          i32.const 0
          i32.store offset=24
          local.get 7
          local.get 3
          i32.store offset=12
          local.get 7
          local.get 0
          i32.store offset=8
        end
        local.get 8
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 10
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            local.get 7
            i32.load offset=28
            local.tee 8
            i32.const 2
            i32.shl
            i32.const 65868
            i32.add
            local.tee 5
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store
            local.get 0
            br_if 1 (;@3;)
            i32.const 0
            local.get 9
            i32.const -2
            local.get 8
            i32.rotl
            i32.and
            i32.store offset=65568
            br 2 (;@2;)
          end
          local.get 10
          i32.const 16
          i32.const 20
          local.get 10
          i32.load offset=16
          local.get 7
          i32.eq
          select
          i32.add
          local.get 0
          i32.store
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 10
        i32.store offset=24
        block  ;; label = @3
          local.get 7
          i32.load offset=16
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 5
          i32.store offset=16
          local.get 5
          local.get 0
          i32.store offset=24
        end
        local.get 7
        i32.load offset=20
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        i32.store offset=20
        local.get 5
        local.get 0
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 7
          local.get 4
          local.get 3
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 0
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 7
        local.get 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 7
        local.get 3
        i32.add
        local.tee 3
        local.get 4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 3
        local.get 4
        i32.add
        local.get 4
        i32.store
        block  ;; label = @3
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const -8
          i32.and
          i32.const 65604
          i32.add
          local.set 5
          i32.const 0
          i32.load offset=65584
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              i32.const 1
              local.get 6
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 8
              local.get 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 8
              local.get 2
              i32.or
              i32.store offset=65564
              local.get 5
              local.set 8
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.set 8
          end
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 8
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 0
          local.get 8
          i32.store offset=8
        end
        i32.const 0
        local.get 3
        i32.store offset=65584
        i32.const 0
        local.get 4
        i32.store offset=65572
      end
      local.get 7
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;17;) (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    local.get 0
    i32.sub
    i32.const 7
    i32.and
    i32.add
    local.tee 3
    local.get 2
    i32.const 3
    i32.or
    i32.store offset=4
    local.get 1
    i32.const -8
    local.get 1
    i32.sub
    i32.const 7
    i32.and
    i32.add
    local.tee 4
    local.get 3
    local.get 2
    i32.add
    local.tee 5
    i32.sub
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=65588
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=65588
        i32.const 0
        i32.const 0
        i32.load offset=65576
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=65576
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=65584
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=65584
        i32.const 0
        i32.const 0
        i32.load offset=65572
        local.get 0
        i32.add
        local.tee 2
        i32.store offset=65572
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 2
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.load offset=4
        local.tee 1
        i32.const 3
        i32.and
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        local.set 6
        local.get 4
        i32.load offset=12
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.load offset=8
              local.tee 7
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=65564
              i32.const -2
              local.get 1
              i32.const 3
              i32.shr_u
              i32.rotl
              i32.and
              i32.store offset=65564
              br 2 (;@3;)
            end
            local.get 7
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 7
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=24
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              local.get 4
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  i32.load offset=20
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  i32.const 20
                  i32.add
                  local.set 7
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                local.get 4
                i32.const 16
                i32.add
                local.set 7
              end
              loop  ;; label = @6
                local.get 7
                local.set 9
                local.get 1
                local.tee 2
                i32.const 20
                i32.add
                local.set 7
                local.get 2
                i32.load offset=20
                local.tee 1
                br_if 0 (;@6;)
                local.get 2
                i32.const 16
                i32.add
                local.set 7
                local.get 2
                i32.load offset=16
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 9
              i32.const 0
              i32.store
              br 1 (;@4;)
            end
            i32.const 0
            local.set 2
          end
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 4
              local.get 4
              i32.load offset=28
              local.tee 7
              i32.const 2
              i32.shl
              i32.const 65868
              i32.add
              local.tee 1
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=65568
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=65568
              br 2 (;@3;)
            end
            local.get 8
            i32.const 16
            i32.const 20
            local.get 8
            i32.load offset=16
            local.get 4
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 8
          i32.store offset=24
          block  ;; label = @4
            local.get 4
            i32.load offset=16
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 2
            i32.store offset=24
          end
          local.get 4
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 2
          i32.store offset=24
        end
        local.get 6
        local.get 0
        i32.add
        local.set 0
        local.get 4
        local.get 6
        i32.add
        local.tee 4
        i32.load offset=4
        local.set 1
      end
      local.get 4
      local.get 1
      i32.const -2
      i32.and
      i32.store offset=4
      local.get 5
      local.get 0
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 5
      local.get 0
      i32.add
      local.get 0
      i32.store
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 65604
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=65564
            local.tee 1
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            local.get 0
            i32.or
            i32.store offset=65564
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 2
        local.get 5
        i32.store offset=8
        local.get 0
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 2
        i32.store offset=12
        local.get 5
        local.get 0
        i32.store offset=8
        br 1 (;@1;)
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 5
      local.get 2
      i32.store offset=28
      local.get 5
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 65868
      i32.add
      local.set 1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=65568
            local.tee 7
            i32.const 1
            local.get 2
            i32.shl
            local.tee 4
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 7
            local.get 4
            i32.or
            i32.store offset=65568
            local.get 1
            local.get 5
            i32.store
            local.get 5
            local.get 1
            i32.store offset=24
            br 1 (;@3;)
          end
          local.get 0
          i32.const 0
          i32.const 25
          local.get 2
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 2
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 2
          local.get 1
          i32.load
          local.set 7
          loop  ;; label = @4
            local.get 7
            local.tee 1
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 7
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 1
            local.get 7
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 4
            i32.load
            local.tee 7
            br_if 0 (;@4;)
          end
          local.get 4
          local.get 5
          i32.store
          local.get 5
          local.get 1
          i32.store offset=24
        end
        local.get 5
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 5
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=8
      local.tee 2
      local.get 5
      i32.store offset=12
      local.get 1
      local.get 5
      i32.store offset=8
      local.get 5
      i32.const 0
      i32.store offset=24
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 2
      i32.store offset=8
    end
    local.get 3
    i32.const 8
    i32.add)
  (func (;18;) (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 4
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=65580
        i32.lt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const 0
                i32.load offset=65584
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=12
                local.set 2
                block  ;; label = @7
                  local.get 4
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 2
                  local.get 1
                  i32.load offset=8
                  local.tee 5
                  i32.ne
                  br_if 2 (;@5;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=65564
                  i32.const -2
                  local.get 4
                  i32.const 3
                  i32.shr_u
                  i32.rotl
                  i32.and
                  i32.store offset=65564
                  br 5 (;@2;)
                end
                local.get 1
                i32.load offset=24
                local.set 6
                block  ;; label = @7
                  local.get 2
                  local.get 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  br 4 (;@3;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load offset=20
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    i32.const 20
                    i32.add
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 1
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 1
                  i32.const 16
                  i32.add
                  local.set 5
                end
                loop  ;; label = @7
                  local.get 5
                  local.set 7
                  local.get 4
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 3 (;@3;)
              end
              local.get 3
              i32.load offset=4
              local.tee 2
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 3 (;@2;)
              i32.const 0
              local.get 0
              i32.store offset=65572
              local.get 3
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 3
              local.get 0
              i32.store
              return
            end
            local.get 5
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 5
            i32.store offset=8
            br 2 (;@2;)
          end
          i32.const 0
          local.set 2
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 1
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 65868
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 2
            i32.store
            local.get 2
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=65568
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=65568
            br 2 (;@2;)
          end
          local.get 6
          i32.const 16
          i32.const 20
          local.get 6
          i32.load offset=16
          local.get 1
          i32.eq
          select
          i32.add
          local.get 2
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 2
        local.get 6
        i32.store offset=24
        block  ;; label = @3
          local.get 1
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 2
          i32.store offset=24
        end
        local.get 1
        i32.load offset=20
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=20
        local.get 4
        local.get 2
        i32.store offset=24
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=65588
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=65588
                  i32.const 0
                  i32.const 0
                  i32.load offset=65576
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=65576
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  i32.const 0
                  i32.load offset=65584
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=65572
                  i32.const 0
                  i32.const 0
                  i32.store offset=65584
                  return
                end
                block  ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=65584
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=65584
                  i32.const 0
                  i32.const 0
                  i32.load offset=65572
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=65572
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  return
                end
                local.get 4
                i32.const -8
                i32.and
                local.get 0
                i32.add
                local.set 0
                local.get 3
                i32.load offset=12
                local.set 2
                block  ;; label = @7
                  local.get 4
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    local.get 3
                    i32.load offset=8
                    local.tee 5
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=65564
                    i32.const -2
                    local.get 4
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store offset=65564
                    br 5 (;@3;)
                  end
                  local.get 5
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 5
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 3
                i32.load offset=24
                local.set 6
                block  ;; label = @7
                  local.get 2
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  br 3 (;@4;)
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.load offset=20
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 20
                    i32.add
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.load offset=16
                  local.tee 4
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 5
                end
                loop  ;; label = @7
                  local.get 5
                  local.set 7
                  local.get 4
                  local.tee 2
                  i32.const 20
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=20
                  local.tee 4
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 5
                  local.get 2
                  i32.load offset=16
                  local.tee 4
                  br_if 0 (;@7;)
                end
                local.get 7
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 3
              local.get 4
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              br 3 (;@2;)
            end
            i32.const 0
            local.set 2
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 65868
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 2
              i32.store
              local.get 2
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=65568
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              i32.store offset=65568
              br 2 (;@3;)
            end
            local.get 6
            i32.const 16
            i32.const 20
            local.get 6
            i32.load offset=16
            local.get 3
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 2
          local.get 6
          i32.store offset=24
          block  ;; label = @4
            local.get 3
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 2
            i32.store offset=24
          end
          local.get 3
          i32.load offset=20
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=20
          local.get 4
          local.get 2
          i32.store offset=24
        end
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        i32.const 0
        i32.load offset=65584
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=65572
        return
      end
      block  ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 65604
        i32.add
        local.set 2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load offset=65564
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=65564
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block  ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 65868
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=65568
              local.tee 4
              i32.const 1
              local.get 2
              i32.shl
              local.tee 5
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              local.get 5
              i32.or
              i32.store offset=65568
              i32.const 8
              local.set 0
              i32.const 24
              local.set 2
              local.get 3
              local.set 5
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            i32.const 25
            local.get 2
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 2
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 2
            local.get 3
            i32.load
            local.set 5
            loop  ;; label = @5
              local.get 5
              local.tee 4
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 0
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 29
              i32.shr_u
              local.set 5
              local.get 2
              i32.const 1
              i32.shl
              local.set 2
              local.get 4
              local.get 5
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 3
              i32.load
              local.tee 5
              br_if 0 (;@5;)
            end
            i32.const 8
            local.set 0
            i32.const 24
            local.set 2
            local.get 4
            local.set 5
          end
          local.get 1
          local.set 4
          local.get 1
          local.set 7
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 5
        local.get 1
        i32.store offset=12
        i32.const 8
        local.set 2
        local.get 4
        i32.const 8
        i32.add
        local.set 3
        i32.const 0
        local.set 7
        i32.const 24
        local.set 0
      end
      local.get 3
      local.get 1
      i32.store
      local.get 1
      local.get 2
      i32.add
      local.get 5
      i32.store
      local.get 1
      local.get 4
      i32.store offset=12
      local.get 1
      local.get 0
      i32.add
      local.get 7
      i32.store
      i32.const 0
      i32.const 0
      i32.load offset=65596
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=65596
    end)
  (func (;19;) (type 1) (param i32))
  (func (;20;) (type 1) (param i32))
  (func (;21;) (type 0) (result i32)
    i32.const 66060
    call 19
    i32.const 66064)
  (func (;22;) (type 3)
    i32.const 66060
    call 20)
  (func (;23;) (type 2) (param i32) (result i32)
    i32.const 1)
  (func (;24;) (type 1) (param i32))
  (func (;25;) (type 2) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      block  ;; label = @2
        i32.const 0
        i32.load offset=66068
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=66068
        call 25
        local.set 1
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=66068
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load offset=66068
        call 25
        local.get 1
        i32.or
        local.set 1
      end
      block  ;; label = @2
        call 21
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 0
            i32.load offset=76
            i32.const 0
            i32.lt_s
            br_if 0 (;@4;)
            local.get 0
            call 23
            local.set 2
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.get 0
            i32.load offset=28
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            call 25
            local.get 1
            i32.or
            local.set 1
          end
          block  ;; label = @4
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            call 24
          end
          local.get 0
          i32.load offset=56
          local.tee 0
          br_if 0 (;@3;)
        end
      end
      call 22
      local.get 1
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=76
        i32.const 0
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      call 23
      i32.eqz
      local.set 2
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=20
          local.get 0
          i32.load offset=28
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 0
          i32.const 0
          local.get 0
          i32.load offset=36
          call_indirect (type 5)
          drop
          local.get 0
          i32.load offset=20
          br_if 0 (;@3;)
          i32.const -1
          local.set 1
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 1
          local.get 0
          i32.load offset=8
          local.tee 3
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 3
          i32.sub
          i64.extend_i32_s
          i32.const 1
          local.get 0
          i32.load offset=40
          call_indirect (type 6)
          drop
        end
        i32.const 0
        local.set 1
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        i64.const 0
        i64.store offset=16
        local.get 0
        i64.const 0
        i64.store offset=4 align=4
        local.get 2
        br_if 1 (;@1;)
      end
      local.get 0
      call 24
    end
    local.get 1)
  (func (;26;) (type 1) (param i32)
    local.get 0
    global.set 0)
  (func (;27;) (type 2) (param i32) (result i32)
    (local i32 i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 1
    global.set 0
    local.get 1)
  (func (;28;) (type 0) (result i32)
    global.get 0)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 258 258)
  (global (;0;) (mut i32) (i32.const 65536))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) (mut i32) (i32.const 0))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 1))
  (export "set_name" (func 2))
  (export "get_is_admin" (func 3))
  (export "reset" (func 4))
  (export "__indirect_function_table" (table 0))
  (export "fflush" (func 25))
  (export "malloc" (func 16))
  (export "free" (func 18))
  (export "_emscripten_tempret_set" (func 7))
  (export "_emscripten_tempret_get" (func 8))
  (export "emscripten_stack_init" (func 9))
  (export "emscripten_stack_get_free" (func 10))
  (export "emscripten_stack_get_base" (func 11))
  (export "emscripten_stack_get_end" (func 12))
  (export "_emscripten_stack_restore" (func 26))
  (export "_emscripten_stack_alloc" (func 27))
  (export "emscripten_stack_get_current" (func 28))
  (data (;0;) (i32.const 65536) " \02\01\00"))
