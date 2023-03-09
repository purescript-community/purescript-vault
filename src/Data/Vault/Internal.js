"use strict";

export function newUnique() {
  return Symbol();
}

export const empty = Object.create(null);

function _copySM(m) {
  var keys = Object.getOwnPropertySymbols(m),
      sm   = Object.create(null);
  for (var i = 0, len = keys.length; i < len; i++) {
    sm[keys[i]] = m[keys[i]];
  }
  return sm;
}

export function lookup(no, yes, k, m) {
  return k in m ? yes(m[k]) : no;
}

export function insert(k, v, m) {
  var n = _copySM(m);
  n[k] = v;
  return n;
}

export function _delete(k, m) {
  var result = Object.create(null);
  var keys = Object.getOwnPropertySymbols(m);
  for (var i = 0, len = keys.length; i < len; i++) {
    if (keys[i] === k) continue;
    result[keys[i]] = m[keys[i]];
  }
  return result
}

export function union(m, n) {
  var result = Object.create(null);
  var k1 = Object.getOwnPropertySymbols(n);
  for (var i = 0, len = k1.length; i < len; i++) {
    result[k1[i]] = n[k1[i]];
  }
  var k2 = Object.getOwnPropertySymbols(m);
  for (var j = 0, length = k2.length; j < length; j++) {
    result[k2[j]] = n[k2[j]];
  }
  return result;
}