--[[ INCOMPLETE
tutorial: https://medium.com/analytics-vidhya/crypto-basics-fixed-xor-implementation-python-9cfba54f4661
--]]

local function bin(num)
    -- returns a table of bits, least significant first.
    local t={} -- will contain the bits
    while num>0 do
        rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end

local function int(hex,base) --(string, int) Turns hex into an int.
    return tonumber(hex,base)
end

local function zfill(bin_value, length) --this wont work. bin value is a table not a string.
	local temp = value
    if math.abs(length-#value) > 0 then
        for i = 1, math.abs(length-#value) do
            temp = temp .. "0"
        end
    end
    return temp
end

local function xor(bin_value1, bin_value2)
  local temp = ""
  for i = 1, #bin_value1 do
    local char1 = bin_value1:sub(i,i)
    local char2 = bin_value1:sub(i,i)
    if char1 == char2 then temp = temp .. 0 else temp = temp..1 end
  end
  return temp
end

local function bxor(hex_value1,hex_value2)
    
    --step 1-2
    local bin_value1 = bin(int(hex_value1, 16))
    local bin_value2 = bin(int(hex_value2, 16))

    --step 3
    local desired_length = function ()
        if #bin_value1 > #bin_value2 then return bin_value1 else return bin_value2 end
    end
    
    bin_value1 = zfill(bin_value1, desired_length)
    bin_value2 = zfill(bin_value2, desired_length)

    local result = xor(bin_value1, bin_value2)

end

--[[ RC4 Encryption - NeverCast
source: http://www.computercraft.info/forums2/index.php?/topic/8836-rc4-encryption-api/
--]]

local function swapStateIndicies( state )
    local t = state.schedule[state.i]
    state.schedule[state.i] = state.schedule[state.j]
    state.schedule[state.j] = t
end

local function swapIndicies( sch, i, j )
    local t = sch[i]
    sch[i] = sch[j]
    sch[j] = t
end

local function createKeySchedule( sKey )
  local nKeyLength = string.len(sKey)
  local tKey = { string.byte( sKey, 1, nKeyLength) }
  if nKeyLength < 1 or nKeyLength > 256 then
    error("Key length out of bounds. 1 <= length <= 256")
  end
  local tSch = {}
  for i = 0, 255 do
    tSch[i] = i
  end
  local j = 0
  for i = 0, 255 do
    j = ( j + tSch[i] + tKey[(i % nKeyLength) + 1]) % 256
    swapIndicies( tSch, i, j )
  end
  return tSch
end

local function keyGeneration( state, nCount )
  local K = {}
  for i = 1, nCount do
    state.i = ( state.i + 1) % 256
    state.j = ( state.j + state.schedule[state.i - 1]) % 256
    swapStateIndicies( state )
    K[#K+1] = state.schedule[ ( state.schedule[ state.i - 1] + state.schedule[ state.j - 1] - 1)  % 256]
  end
  return K
end

local function cipher( sMessage, state)
  local nCount = string.len(sMessage)
  local K = keyGeneration( state, nCount )
  local sOutput = ""
  for i = 1, nCount do
    sOutput = sOutput .. string.char( bxor( K[i], string.byte(sMessage, i)))
  end
  return sOutput
end

function new( sKey, bEncryption )
  local tSch = createKeySchedule( sKey )
  local nS1 = 0
  local nS2 = 0
  local state = {
    i = nS1,
    j = nS2,
    schedule = tSch
  }
  local tSession = {}
  local sFuncName = "decrypt"
  if bEncryption then
    sFuncName = "encrypt"
  end
  tSession[sFuncName] = function( sMessage )
    local sOutput = cipher( sMessage, state)
    return sOutput
  end
  return tSession
end

--[[ end of RC4 Encryption - NeverCast
--]]

--Create an encryption session:
enc = new("my secret key", true)

--Create a decryption session:
dec = new("my secret key", false)

--Encrypt some text for transmission:
secretText = enc.encrypt("Psst, Lua is cool!")

--Decrypt the text at the other end
plainText = dec.decrypt(secretText)

print(plainText)