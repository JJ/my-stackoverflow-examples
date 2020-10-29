#!/usr/bin/env node

const assert=require('assert').strict;

describe("Test passes",
    function() {
      it("will pass", function() {
        assert.equal(2+2,4);
      })
})
